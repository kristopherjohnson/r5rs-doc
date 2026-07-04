# Note: Building the documentation library requires CHICKEN Scheme (for the `csi` executable).
.PHONY: all clean

all: r5rs-doc.scm

r5rs-doc.scm: generate.scm HTML
	csi -s generate.scm

HTML:
	curl -sSL -o r5rs-html.tar.gz https://conservatory.scheme.org/schemers/Documents/Standards/R5RS/r5rs-html.tar.gz
	tar -xzf r5rs-html.tar.gz
	rm r5rs-html.tar.gz

clean:
	- rm -f r5rs-doc.scm
	- rm -rf HTML
