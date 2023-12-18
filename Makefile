PHONY: clean

clean: 
	rm -rf Figures
	rm -f Rplots.pdf
	rm -f Report.pdf

all: .create-dir Report.pdf Figures/country.png Figures/category.png Figures/pca.png Figures/bubble.png Figures/urbanpop_views_cor.png Figures/earnings_bubble.png Figures/earnings_views_cor.png

.create-dir:
	mkdir Figures

Report.pdf: youtube.csv Report.Rmd
    R -e "rmarkdown::render('Report.Rmd', output_format='pdf_document')"

Figures/earnings_views_cor.png: youtube.csv earnings_views_cor_script.R
	Rscript earnings_views_cor_script.R youtube.csv

Figures/urbanpop_views_cor.png: youtube.csv urbanpop_views_cor_script.R
	Rscript urbanpop_views_cor_script.R youtube.csv

Figures/country.png: youtube.csv country_script.R
	Rscript country_script.R youtube.csv

Figures/category.png: youtube.csv category_script.R
	Rscript category_script.R youtube.csv
	
Figures/pca.png: youtube.csv pca_script.R
	Rscript pca_script.R youtube.csv
	
Figures/bubble.png: youtube.csv bubble.R
	Rscript bubble.R youtube.csv

Figures/earnings_bubble.png: youtube.csv earnings_bubble_script.R
	Rscript earnings_bubble_script.R youtube.csv