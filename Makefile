RSTFILES=lug-idris.rst
43PDFFILES=$(patsubst %.rst,out/%-43.pdf,$(RSTFILES))
169PDFFILES=$(patsubst %.rst,out/%-169.pdf,$(RSTFILES))
1610PDFFILES=$(patsubst %.rst,out/%-1610.pdf,$(RSTFILES))

R2BOPTIONS=--theme=lug

.PHONY: all
all: $(43PDFFILES) $(169PDFFILES) $(1610PDFFILES)

out:
	mkdir out

graphics:
	mkdir graphics

out/%.pdf: %.tex beamerthemelug.sty | graphics out
	xelatex $<
	mv $(patsubst out/%.pdf,%.pdf,$@) out
	rm -f $(patsubst out/%.pdf,%.log,$@) \
	      $(patsubst out/%.pdf,%.aux,$@) \
	      $(patsubst out/%.pdf,%.nav,$@) \
	      $(patsubst out/%.pdf,%.out,$@) \
	      $(patsubst out/%.pdf,%.snm,$@) \
	      $(patsubst out/%.pdf,%.toc,$@) \
	      $(patsubst out/%.pdf,%.vrb,$@)

%-169.tex: %.rst
	rst2beamer $(R2BOPTIONS) --documentoptions="aspectratio=169" $< | grep -v amsmath > $@

%-1610.tex: %.rst
	rst2beamer $(R2BOPTIONS) --documentoptions="aspectratio=1610" $< | grep -v amsmath > $@

%-43.tex: %.rst
	rst2beamer $(R2BOPTIONS) --documentoptions="aspectratio=43" $< | grep -v amsmath > $@
