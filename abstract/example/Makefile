view: assignment2.pdf
	viewpdf assignment2.pdf

assignment2.pdf: assignment2.tex References.bib
	pdflatex -halt-on-error assignment2.tex
	bibtex assignment2
	pdflatex -halt-on-error assignment2.tex

.PHONY: view
