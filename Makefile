.DEFAULT_GOAL := install
CLASS = mluexercise

texlive-update:
	tlmgr update --all

dependencies-install: texlive-update
	tlmgr update --all
	tlmgr install latex ly1 babel libertine eulervm sourcecodepro hyperref relsize listings csquotes titlesec booktabs

install: dependencies-install
	latexmk -outdir=$(CLASS) $(CLASS).dtx -pdf
	cp $(CLASS)/$(CLASS).cls $(CLASS).cls
	cp $(CLASS).dtx $(CLASS)/$(CLASS).dtx

dependencies-samples: texlive-update
	tlmgr install koma-script latex ly1 etoolbox xpatch ifoddpage hyperref xcolor babel oberdiek tools geometry libertine eulervm sourcecodepro microtype csquotes relsize totpages amsmath amscls amsfonts tools cancel pgf algorithm2e listings listingsutf8 booktabs graphics float caption pgfplots

samples: dependencies-samples
	latexmk exercise-english.tex -pdf
	latexmk exercise-german.tex -pdf

ctan: install
	zip $(CLASS) $(CLASS)/README.md $(CLASS)/LICENSE.txt $(CLASS)/$(CLASS).dtx $(CLASS)/mluexercise.ins $(CLASS)/$(CLASS).pdf