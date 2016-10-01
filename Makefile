filename=boa

pdf:
	pdflatex ${filename}.tex
	pdflatex ${filename}.tex
	pdflatex ${filename}.tex
	mv ${filename}.{ps,pdf,log,aux,out,dvi,bbl,blg,toc} output/ 2>/dev/null  || :
	mv a.{idx,ilg,ind} output/ 2>/dev/null  || :
	mv p.{idx,ilg,ind} output/ 2>/dev/null  || :

read:
	evince ${filename}.pdf &

clean:
	rm -f /output/${filename}.{ps,pdf,log,aux,out,dvi,bbl,blg,toc}
	rm -f /output/a.{idx,ilg,ind}
	rm -f /output/p.{idx,ilg,ind}

