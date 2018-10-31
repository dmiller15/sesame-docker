FROM rocker/r-ver:3.5.1

RUN apt-get update -qq \
  && apt-get install -y \
    libcurl4-openssl-dev \
    libssh2-1-dev \
    libssl-dev \
    libxml2-dev \
    zlib1g-dev

RUN R -e "install.packages('BiocManager'); \
          library(BiocManager); \
          BiocManager::install(version='3.8',update=TRUE,ask=FALSE); \
          BiocManager::install(c('sesame','sesameData','ExperimentHub'),update=TRUE,ask=FALSE,version='3.8')"

RUN R -e "library(sesameData)"

ADD sesame-lvl3betas.R /home/sesame-scripts/sesame-lvl3betas.R

ENV SESAME 0.99.7
ENV SESAMEDATA 0.99.5
ENV EXPERIMENTHUB 1.7.7
