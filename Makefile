PHONY: clean

clean: 
	rm -rf Figures

all: .create-dir Figures/country.png Figures/category.png Figures/pca.png Figures/subs_views_cor.png Figures/year_views_cor.png

.create-dir:
	mkdir Figures

Figures/country.png: youtube.csv country_script.R
	Rscript country_script.R youtube.csv

Figures/category.png: youtube.csv category_script.R
	Rscript category_script.R youtube.csv
	
Figures/pca.png: youtube.csv pca_script.R
	Rscript pca_script.R youtube.csv
	
Figures/bubble.png: youtube.csv bubble.R
	Rscript bubble.R youtube.csv

Figures/year_views_cor.png: youtube.csv year_views_cor_script.R
	Rscript year_views_cor_script.R youtube.csv
