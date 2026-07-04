# R5RS Scheme Documentation Library

A lightweight, fully portable, zero-dependency Scheme library for looking up R5RS documentation directly from your Scheme program or REPL. 

This library provides an offline documentation index of keywords and procedures defined in the Revised<sup>5</sup> Report on the Algorithmic Language Scheme (R5RS).

## Origin of Documentation Text

The documentation text provided by this library is extracted directly from the [Revised<sup>5</sup> Report on the Algorithmic Language Scheme](https://conservatory.scheme.org/schemers/Documents/Standards/R5RS/).

## Usage

Load the library into your R5RS-compatible Scheme environment (such as CHICKEN, Gauche, MIT Scheme, Guile, etc):

```scheme
(load "./r5rs-doc.scm")
```

### Available Procedures

- `(r5rs-doc word)`: Looks up and prints the R5RS documentation for the given keyword or procedure. The `word` argument can be a symbol or a string. The search is case-insensitive.
- `(r5rs-doc-string word)`: Returns the documentation string for the given keyword or procedure. If the documentation is not found, it returns `#f`.
- `(r5rs-doc-list)`: Returns a list of strings representing all symbols/keywords available for documentation lookup.

### Examples

```scheme
;; Print documentation to standard output
(r5rs-doc 'map)
(r5rs-doc "string-append")
(r5rs-doc 'LIST->STRING) ; lookups are case-insensitive

;; Retrieve documentation as a string for programmatic use
(define map-doc (r5rs-doc-string 'map))
(if map-doc
    (display "Documentation found!\n")
    (display "Not found.\n"))

;; Get a list of all documented symbols
(r5rs-doc-list)
;; => ("+" "-" "*" "/" "abs" "acos" "and" "angle" ...)
```

## How It Works

The `r5rs-doc.scm` file contains the extracted documentation statically embedded as an association list (`*r5rs-docs*`). You don't need any additional tools, dependencies, or parsers—just load the file and the lookups are instantaneous. 

The `generate.scm` script is included in this repository and was used to programmatically scrape the R5RS HTML specification and bundle it into pure Scheme code. 

If you want to regenerate the documentation library yourself, you can simply run `make`. The `Makefile` will automatically download the original R5RS HTML specification (if it's not already downloaded) and run `generate.scm` to build `r5rs-doc.scm`.

## License

This project is dedicated to the public domain under the [CC0 1.0 Universal](LICENSE) license.
