fast:
	xelatex -halt-on-error -shell-escape present.tex
	viewpdf present.pdf

present:
	xelatex -halt-on-error -shell-escape present.tex
	biber present
	xelatex -halt-on-error -shell-escape present.tex
	viewpdf present.pdf

.PHONY: present fast
