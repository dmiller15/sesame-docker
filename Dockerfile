FROM rocker/r-ver:3.5.0

RUN apt-get update -qq \
  && apt-get install -y \
    libcurl4-openssl-dev \
    libssh2-1-dev \
    libssl-dev \
    libxml2-dev \
    zlib1g-dev

RUN R -e "if (!requireNamespace("BiocManager", quietly=TRUE))
              install.packages("BiocManager"); \
          BiocManager::install(version = "devel"); \
          BiocManager::valid(); \
          BiocManager::install(c("sesame","sesameData","ExperimentHub",version="devel")"

ADD sesame-lvl3betas.R /home/sesame-scripts/sesame-lvl3betas.R

ENV SESAME 0.99.7
ENV SESAMEDATA 0.99.5
ENV EXPERIMENTHUB 1.7.7
