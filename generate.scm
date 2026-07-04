#|
  generate.scm

  This script parses the raw R5RS HTML specification files and extracts
  the documentation blocks for every standard Scheme procedure and syntax keyword.
  It generates a standalone, portable Scheme file (`r5rs-doc.scm`) containing an
  association list of all extracted definitions.

  To run this script, you must have CHICKEN Scheme installed (Version 5+).
  Run it from the terminal via:
      csi -s generate.scm
|#

(import (chicken io)
        (chicken file)
        (chicken pathname)
        (chicken string)
        (chicken irregex)
        srfi-1
        srfi-13
        srfi-69)

;; Result of downloading and expanding
;; https://conservatory.scheme.org/schemers/Documents/Standards/R5RS/r5rs-html.tar.gz
(define docs-dir "HTML")

(define (unescape-html str)
  (let* ((str (string-translate* str '(("&lt;" . "<")
                                       ("&gt;" . ">")
                                       ("&amp;" . "&")
                                       ("&quot;" . "\"")
                                       ("&#39;" . "'")
                                       ("&nbsp;" . " ")
                                       ("\xa0" . " "))))
         )
    str))

;; Load index
(define index-content
  (with-input-from-file (make-pathname docs-dir "r5rs-Z-H-15.html") read-string))

(define index (make-hash-table equal?))

;; Matches: <a href="([^"]+)"><tt>([^<]+)</tt></a>
(define matches
  (irregex-fold
    "<a href=\"([^\"]+)\"><tt>([^<]+)</tt></a>"
    (lambda (i m acc)
      (cons (list (irregex-match-substring m 1)
                  (irregex-match-substring m 2))
            acc))
    '()
    index-content))

(for-each
  (lambda (m)
    (let ((href (car m))
          (word (unescape-html (cadr m))))
      (unless (hash-table-exists? index word)
        (hash-table-set! index word href))))
  (reverse matches))

(define re-br (irregex "<br/?>" 'i))
(define re-p (irregex "<p>" 'i))
(define re-tag (irregex "<[^>]+>"))
(define re-nl (irregex "\n\\s*\n"))
(define re-h (irregex "<h[1-6]>" 'i))
(define re-boundaries (irregex "(<div align=left><u>|<h[1-6]>|<p><div class=navigation>)" 'i))

;; clean html logic
(define (clean-html text)
  (let* ((text (string-translate* text '(("<em>" . "")
                                         ("</em>" . "")
                                         ("<i>" . "")
                                         ("</i>" . "")
                                         ("<sub>" . "_")
                                         ("</sub>" . ""))))
         (text (irregex-replace/all re-br text "\n"))
         (text (irregex-replace/all re-p text "\n\n"))
         (text (irregex-replace/all re-tag text ""))
         (text (unescape-html text))
         (text (irregex-replace/all re-nl text "\n\n")))
    (string-trim-both text)))

;; file to words grouping
(define file-to-words (make-hash-table equal?))
(hash-table-walk index
                 (lambda (word href)
                   (let* ((parts (string-split href "#" #t))
                          (filename (car parts))
                          (anchor (cadr parts)))
                     (hash-table-set! file-to-words filename
                                      (cons (list anchor word)
                                            (hash-table-ref/default file-to-words filename '()))))))

(define file-docs (make-hash-table equal?))

;; python string rfind equivalent
(define (string-rfind str target)
  (let ((tlen (string-length target)))
    (let loop ((i (- (string-length str) tlen)))
      (cond ((< i 0) -1)
            ((string=? (substring str i (+ i tlen)) target) i)
            (else (loop (- i 1)))))))

;; Process each file
(hash-table-walk file-to-words
                 (lambda (filename words)
                   (let ((content (with-input-from-file (make-pathname docs-dir filename) read-string)))
                     (for-each
                       (lambda (w)
                         (let* ((anchor (car w))
                                (word (cadr w))
                                (split-str (string-append "<a name=\"" anchor "\"></a>"))
                                (idx (string-contains content split-str)))

                           (if (not idx)
                               (hash-table-set! file-docs word (string-append "Documentation not found for " word "."))
                               (let* ((before-start (max 0 (- idx 5000)))
                                      (before (substring content before-start idx))
                                      (after-start (+ idx (string-length split-str)))
                                      (after-end (min (string-length content) (+ after-start 20000)))
                                      (after (substring content after-start after-end))
                                      (div-idx (string-rfind before "<div align=left>"))
                                      (h-idx -1))

                                 (irregex-fold
                                  re-h
                                   (lambda (i m acc)
                                     (set! h-idx (irregex-match-start-index m 0))
                                     acc)
                                   '()
                                   before)

                                 (let ((start-idx (max div-idx h-idx)))
                                   (when (= start-idx -1)
                                     (set! start-idx (max 0 (- (string-length before) 100))))

                                   (let* ((end-idx (string-length after))
                                          (b-matches (irregex-fold
                                      re-boundaries
                                                       (lambda (i m acc)
                                                         (cons (list (irregex-match-start-index m 0)
                                                                     (irregex-match-substring m 1))
                                                               acc))
                                                       '()
                                                       after)))

                                     (let loop ((bs (reverse b-matches)))
                                       (if (null? bs)
                                           (when (not (null? b-matches))
                                             (set! end-idx (caar b-matches)))
                                           (let* ((b-start (caar bs))
                                                  (b-text (string-downcase (cadar bs))))
                                             (if (or (string-prefix? "<h" b-text)
                                                     (string-contains b-text "navigation"))
                                                 (set! end-idx b-start)
                                                 (let* ((sub (substring after 0 b-start))
                                                        (last-div (string-rfind sub "</div>"))
                                                        (text-between (if (not (= last-div -1))
                                                                          (substring sub (+ last-div 6))
                                                                          sub))
                                                        (clean-between (string-trim-both (irregex-replace/all re-tag text-between ""))))
                                                   (if (> (string-length clean-between) 0)
                                                       (set! end-idx b-start)
                                                       (loop (cdr bs))))))))

                                     (let ((chunk (string-append (substring before start-idx) (substring after 0 end-idx))))
                                       (hash-table-set! file-docs word (clean-html chunk)))))))))
                       words))))

(define scm-path "r5rs-doc.scm")
(with-output-to-file scm-path
  (lambda ()
    (display ";; R5RS Documentation Library\n")
    (display ";; Portable to any R5RS-compatible Scheme implementation.\n\n")
    (display "(define *r5rs-docs*\n")
    (display "  `(\n")

    (hash-table-walk file-docs
                     (lambda (word doc)
                       (let ((doc-trim (string-trim-both doc)))
                         (when (> (string-length doc-trim) 0)
                           (let* ((escaped-doc (string-translate* doc-trim '(("\\" . "\\\\") ("\"" . "\\\""))))
                                  (escaped-word (string-translate* word '(("\\" . "\\\\") ("\"" . "\\\"")))))
                             (display "    (\"")
                             (display escaped-word)
                             (display "\" . \"")
                             (display escaped-doc)
                             (display "\")\n"))))))

    (display "  ))\n\n")

    (display "(define (assoc-ci key alist)\n")
    (display "  (cond ((null? alist) #f)\n")
    (display "        ((string-ci=? key (car (car alist))) (car alist))\n")
    (display "        (else (assoc-ci key (cdr alist)))))\n\n")

    (display ";; (r5rs-doc-string word)\n")
    (display ";; Returns the R5RS documentation string for the given keyword or procedure,\n")
    (display ";; or #f if not found. The word can be a symbol or a string. Search is case-insensitive.\n")
    (display "(define (r5rs-doc-string word)\n")
    (display "  (let* ((word-str (if (symbol? word) (symbol->string word) word))\n")
    (display "         (entry (assoc-ci word-str *r5rs-docs*)))\n")
    (display "    (if entry (cdr entry) #f)))\n\n")

    (display ";; (r5rs-doc word)\n")
    (display ";; Looks up and prints the R5RS documentation for the given keyword or procedure.\n")
    (display "(define (r5rs-doc word)\n")
    (display "  (let ((doc-str (r5rs-doc-string word)))\n")
    (display "    (if doc-str\n")
    (display "        (display doc-str)\n")
    (display "        (begin\n")
    (display "          (display \"Documentation not found for \")\n")
    (display "          (display word)))\n")
    (display "    (newline)))\n\n")

    (display ";; (r5rs-doc-list)\n")
    (display ";; Returns a list of all symbols/keywords available for documentation lookup.\n")
    (display "(define (r5rs-doc-list)\n")
    (display "  (map car *r5rs-docs*))\n")
    ))
(display "Done.\n")
