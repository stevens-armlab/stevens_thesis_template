DOC_NAME := thesis_proposal

createfolder:
	mkdir -p pdf

thesis:
	pdflatex -output-directory pdf --jobname=$(DOC_NAME) main.tex; \
	bibtex pdf/$(DOC_NAME).aux; \
	pdflatex -output-directory pdf --jobname=$(DOC_NAME) main.tex; \
	pdflatex -output-directory pdf --jobname=$(DOC_NAME) main.tex; \

clean_temp_files:
	rm -f pdf/*.dvi
	rm -f pdf/*.ps
	rm -f pdf/*.aux
	rm -f pdf/*.fdb_latexmk
	rm -f pdf/*.fls
	rm -f pdf/*.log
	rm -f pdf/*.out
	rm -f pdf/*.bbl
	rm -f pdf/*.blg
	rm -f pdf/*.toc

all: createfolder thesis clean_temp_files
