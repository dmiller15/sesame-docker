FROM rocker/r-ver:3.4.4

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
          devtools::install_github('zwdzwd/sesame',ref='1082d17'); \
          Sys.setenv(SESAMEHOME='/home/sesame-refs/'); \
          sesame::cacheBuiltInData()"

ADD sesame-lvl3betas.R /home/sesame-scripts/sesame-lvl3betas.R

ENV SESAME 01.01.00
