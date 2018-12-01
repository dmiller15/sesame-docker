FROM rocker/r-ver:3.5.1

RUN apt-get update -qq \
  && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    zlib1g-dev \
  && install2.r \
    devtools 

RUN mkdir /home/sesame-refs

RUN R -e "source('https://bioconductor.org/biocLite.R'); \
          biocLite('DNAcopy'); \
          devtools::install_github('zwdzwd/sesame'); \
          devtools::install_github('zwdzwd/sesameData',ref='7c3909a')"

RUN R -e "library(sesameData)"

ADD sesame-lvl3betas.R /home/sesame-scripts/sesame-lvl3betas.R

ENV SESAME 0.99.7
ENV SESAMEDATA 1.1.1 
