all: country.png category.png

country.png: youtube.csv country_script.R
	Rscript country_script.R youtube.csv

category.png: youtube.csv category_script.R
	Rscript category_script.R youtube.csv
	
tsne.png: youtube.csv tsne_script.R
	Rscript tsne_script.R youtube.csv

clean:
	rm -f country.png category.png tsne.png
