# Makefile to create PDF documents from LaTeX-Files
# Needed software packages: pdflatex, rubber
# License: No copyright, just do what the heck you want with it
 
all: pdf clean
 
pdf:
	for file in $$(ls *tex | cut -d \. -f 1) ; do make $$file.pdf ; done
 
%.pdf: %.tex
	rubber -m pdftex $<
 
clean:
	-find . \( -name "*.aux" -o -name "*.lof" \
                -o -name "*.log" -o -name "*.out" \
		-o -name "*.toc" -o -name "*.bbl" \
		-o -name "*.nls" -o -name "*.blg" -o -name "*-blx.bib"\
                -o -name "*.lot" -o -name "*.lol" \) | xargs rm
 
cleanall:
	rm -f *.toc *.pdf *.aux *.log
 
.PHONY: all pdf clean cleanall
.SILENT: pdf
 
# vim: set tabstop=4 shiftwidth=4 noexpandtab:
