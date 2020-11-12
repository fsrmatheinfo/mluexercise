CLASS = mluexercise

dependencies:
	tlmgr update --all
	tlmgr install latex geometry babel libertine eulervm sourcecodepro hyperref relsize listings csquotes titlesec

install:
	latexmk -outdir=$(CLASS) $(CLASS).dtx -pdf
	cp $(CLASS)/$(CLASS).cls .

samples: install
	latexmk example-english.tex -pdf
	latexmk example-german.tex -pdf

ctan: install
	zip $(CLASS) $(CLASS)/README.md $(CLASS)/LICENSE.txt $(CLASS)/$(CLASS).cls $(CLASS)/mluexercise.ins $(CLASS)/$(CLASS).pdf