FROM rocker/r-ver:3.5.1

RUN apt-get update -qq \
  && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    zlib1g-dev \
  && install2.r \
    devtools 

RUN R -e "install.packages('BiocManager'); \
          library(BiocManager); \
          BiocManager::install(version='3.8',update=TRUE,ask=FALSE); \
          devtools::install_github('zwdzwd/sesameData',ref='7c3909a'); \
          BiocManager::install('sesame',update=TRUE,ask=FALSE,version='3.8')"

RUN R -e "library(sesameData)"

ENV http_proxy "http://cloud-proxy:3128"
ENV https_proxy "http://cloud-proxy:3128"

ADD sesame-lvl3betas.R /home/sesame-scripts/sesame-lvl3betas.R

ENV SESAME 0.99.7
ENV SESAMEDATA 1.1.1 
ENV GDC 0.1.1
