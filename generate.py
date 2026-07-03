import re
import html
import os

# Path to expanded https://conservatory.scheme.org/schemers/Documents/Standards/R5RS/r5rs-html.tar.gz directory
docs_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'r5rs_HTML')

# Load index
with open(os.path.join(docs_dir, 'r5rs-Z-H-15.html'), 'r') as f:
    index_content = f.read()

index = {}
matches = re.findall(r'<a href="([^"]+)"><tt>([^<]+)</tt></a>', index_content)
for href, word in matches:
    word = html.unescape(word)
    if word not in index:
        index[word] = href



def clean_html(text):
    text = text.replace('<em>', '').replace('</em>', '')
    text = text.replace('<i>', '').replace('</i>', '')
    text = text.replace('<sub>', '_').replace('</sub>', '')
    text = re.sub(r'<br/?>', '\n', text, flags=re.IGNORECASE)
    text = re.sub(r'<p>', '\n\n', text, flags=re.IGNORECASE)

    text = re.sub(r'<[^>]+>', '', text)

    text = html.unescape(text)
    text = text.replace('\xa0', ' ')
    text = re.sub(r'\n\s*\n', '\n\n', text)
    return text.strip()

file_to_words = {}
for word, href in index.items():
    filename, anchor = href.split('#')
    if filename not in file_to_words:
        file_to_words[filename] = []
    file_to_words[filename].append((anchor, word))

file_docs = {}

for filename, words in file_to_words.items():
    with open(os.path.join(docs_dir, filename), 'r') as f:
        content = f.read()

    for anchor, word in words:
        parts = content.split(f'<a name="{anchor}"></a>')
        if len(parts) < 2:
            file_docs[word] = f"Documentation not found for {word}."
            continue

        before = parts[0]
        after = parts[1]

        div_idx = before.rfind('<div align=left>')
        h_idx = -1
        m = list(re.finditer(r'<h[1-6]>', before, re.IGNORECASE))
        if m: h_idx = m[-1].start()
        start_idx = max(div_idx, h_idx)
        if start_idx == -1:
            start_idx = max(0, len(before) - 100)

        end_idx = len(after)
        boundaries = [m for m in re.finditer(r'(<div align=left><u>|<h[1-6]>|<p><div class=navigation>)', after, re.IGNORECASE)]

        for b in boundaries:
            b_start = b.start()
            b_text = b.group(1).lower()

            if b_text.startswith('<h') or 'navigation' in b_text:
                end_idx = b_start
                break
            else:
                sub = after[:b_start]
                last_div = sub.rfind('</div>')
                if last_div != -1:
                    text_between = sub[last_div+6:]
                else:
                    text_between = sub

                clean_between = re.sub(r'<[^>]+>', '', text_between).strip()
                if len(clean_between) > 0:
                    end_idx = b_start
                    break
        else:
            if boundaries:
                end_idx = boundaries[-1].start()

        chunk = before[start_idx:] + after[:end_idx]
        file_docs[word] = clean_html(chunk)

scm_path = os.path.join(os.path.dirname(docs_dir), 'r5rs-doc.scm')
with open(scm_path, 'w') as f:
    f.write(';; R5RS Documentation Library\n')
    f.write(';; Portable to any R5RS-compatible Scheme implementation.\n\n')

    f.write('(define *r5rs-docs*\n')
    f.write('  `(\n')

    for word, doc in file_docs.items():
        escaped_doc = doc.replace('\\', '\\\\').replace('"', '\\"')
        escaped_word = word.replace('\\', '\\\\').replace('"', '\\"')
        f.write(f'    ("{escaped_word}" . "{escaped_doc}")\n')

    f.write('  ))\n\n')

    f.write('(define (assoc-ci key alist)\n')
    f.write('  (cond ((null? alist) #f)\n')
    f.write('        ((string-ci=? key (car (car alist))) (car alist))\n')
    f.write('        (else (assoc-ci key (cdr alist)))))\n\n')

    f.write(';; (r5rs-doc-string word)\n')
    f.write(';; Returns the R5RS documentation string for the given keyword or procedure,\n')
    f.write(';; or #f if not found. The word can be a symbol or a string. Search is case-insensitive.\n')
    f.write('(define (r5rs-doc-string word)\n')
    f.write('  (let* ((word-str (if (symbol? word) (symbol->string word) word))\n')
    f.write('         (entry (assoc-ci word-str *r5rs-docs*)))\n')
    f.write('    (if entry (cdr entry) #f)))\n\n')

    f.write(';; (r5rs-doc word)\n')
    f.write(';; Looks up and prints the R5RS documentation for the given keyword or procedure.\n')
    f.write('(define (r5rs-doc word)\n')
    f.write('  (let ((doc-str (r5rs-doc-string word)))\n')
    f.write('    (if doc-str\n')
    f.write('        (display doc-str)\n')
    f.write('        (begin\n')
    f.write('          (display "Documentation not found for ")\n')
    f.write('          (display word)))\n')
    f.write('    (newline)))\n\n')

    f.write(';; (r5rs-doc-list)\n')
    f.write(';; Returns a list of all symbols/keywords available for documentation lookup.\n')
    f.write('(define (r5rs-doc-list)\n')
    f.write('  (map car *r5rs-docs*))\n')

print("Wrote pure R5RS compatible", scm_path)
