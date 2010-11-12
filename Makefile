all: zip sty pdf

zip: locality.zip

sty: locality.sty

pdf: locality.pdf

dvi: locality.dvi

clean:
	rm -f locality.sty locality.pdf locality.dvi locality.zip *.glo *.log *.aux *.idx

cleanaux:
	rm -f *.glo *.log *.aux *.idx

locality.zip : locality.sty locality.dtx locality.pdf locality.ins README changes.txt
	zip locality.zip locality.sty locality.dtx locality.pdf locality.ins README changes.txt

locality.sty : locality.dtx locality.ins
	latex locality.ins

locality.pdf : locality.sty locality.dtx
	pdflatex locality.dtx

locality.dvi : locality.sty locality.dtx
	latex locality.dtx

	
