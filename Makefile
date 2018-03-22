TEX = tectonic --synctex

handout.pdf: handout.tex
	$(TEX) handout.tex

watch: handout.tex
	@echo Watching for changes...
	@while true; do \
		inotifywait --event MODIFY -q -r $^; \
		make; \
	done

clean:
	@echo Cleaning...
	@rm -rf *~ *.tmp
	@rm -f *.nav *.snm *.bcf *.bbl *.blg *.aux *.end *.fls *.log *.out *.fdb_latexmk *.xml *.gz *.vrb *.aux.copy *.auxlock *.for
