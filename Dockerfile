# Use the rocker/rstudio base image
FROM rocker/verse

# Update package repositories and install man-db package
RUN apt-get update && \
    apt-get install -y man-db && \
    rm -rf /var/lib/apt/lists/*

# Install additional R libraries
RUN R -e "install.packages(c('tidyverse', 'ggplot2', 'rmarkdown'), dependencies=TRUE)"

# Set the working directory
WORKDIR /home/rstudio

# Copy your R scripts or project files into the container
COPY *.R /home/rstudio
COPY *.md /home/rstudio
COPY youtube.csv /home/rstudio
COPY Makefile /home/rstudio