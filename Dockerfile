# Use the rocker/rstudio base image
FROM rocker/rstudio:latest

# Update package repositories and install man-db package
RUN apt-get update && \
    apt-get install -y man-db && \
    rm -rf /var/lib/apt/lists/*

