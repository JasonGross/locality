all: build test

build: zip sty pdf build-test

build-test: locality-qs.tex

test : build-test
	latex locality-qs.tex
	cat locality-qs.lgout

zip: locality.zip

sty: locality.sty

pdf: locality.pdf

dvi: locality.dvi

clean:
	rm -f locality.sty locality.pdf locality.dvi locality.zip *.glo *.log *.aux *.idx locality-qs.tex

cleanaux:
	rm -f *.glo *.log *.aux *.idx

locality.zip : locality.sty locality.dtx locality.pdf locality.ins README changes.txt locality-qs.tex
	zip locality.zip locality.sty locality.dtx locality.pdf locality.ins README changes.txt locality-qs.tex

locality.sty : locality.dtx locality.ins
	latex "\let\Make=y \input locality.ins"

locality.pdf : locality.sty locality.dtx
	pdflatex locality.dtx

locality.dvi : locality.sty locality.dtx
	latex locality.dtx

locality-qs.tex : locality.dtx locality.ins
	latex "\let\Make=y \input locality.ins"
