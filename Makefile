build:
	latexmk -outdir=mluexercise mluexercise.dtx -pdf
	cp mluexercise/mluexercise.cls .
