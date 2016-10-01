filename=boa

pdf:
	pdflatex ${filename}.tex
	pdflatex ${filename}.tex
	pdflatex ${filename}.tex

read:
	evince ${filename}.pdf &

clean:
	rm -f ${filename}.{ps,pdf,log,aux,out,dvi,bbl,blg,toc}
	rm -f a.{idx,ilg,ind}
	rm -f p.{idx,ilg,ind}

