CLASS = mluexercise

texlive-update:
	tlmgr update --all

dependencies-install: texlive-update
	tlmgr update --all
	tlmgr install latex ly1 geometry babel libertine eulervm sourcecodepro hyperref relsize listings csquotes titlesec

install: dependencies-install
	latexmk -outdir=$(CLASS) $(CLASS).dtx -pdf
	cp $(CLASS)/$(CLASS).cls .

dependencies-samples: texlive-update
	tlmgr install koma-script latex ly1 etoolbox xpatch hyperref xcolor babel oberdiek tools geometry libertine eulervm sourcecodepro microtype csquotes relsize totpages amsmath amscls amsfonts tools cancel pgf algorithm2e listings listingsutf8 graphics float caption pgfplots

samples: dependencies-samples
	latexmk exercise-english.tex -pdf
	latexmk exercise-german.tex -pdf

ctan: install
	zip $(CLASS) $(CLASS)/README.md $(CLASS)/LICENSE.txt $(CLASS)/$(CLASS).cls $(CLASS)/mluexercise.ins $(CLASS)/$(CLASS).pdf