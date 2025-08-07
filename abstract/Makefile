view: abstract.pdf
	viewpdf abstract.pdf

force:
	pdflatex -halt-on-error abstract.tex
	bibtex abstract
	pdflatex -halt-on-error abstract.tex
	viewpdf abstract.pdf

abstract.pdf: abstract.tex references.bib
	pdflatex -halt-on-error abstract.tex
	bibtex abstract
	pdflatex -halt-on-error abstract.tex

.PHONY: view force
