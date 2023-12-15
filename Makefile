PHONY: clean

clean: 
	rm -rf Figures

.create-dir:
	mkdir Figures

Figures/country.png: youtube.csv country_script.R
	Rscript country_script.R youtube.csv

Figures/category.png: youtube.csv category_script.R
	Rscript category_script.R youtube.csv
	
Figures/tsne.png: youtube.csv tsne_script.R
	Rscript tsne_script.R youtube.csv
	
Figures/pca.png: youtube.csv pca_script.R
	Rscript pca_script.R youtube.csv
	
