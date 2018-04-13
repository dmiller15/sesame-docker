FROM r-base 

MAINTAINER Daniel P. Miller <dmiller15@uchicago.edu>

RUN apt-get update -qq && \
    apt-get install -y libssl-dev libcurl4-openssl-dev libssh2-1-dev libxml2-dev && \
    apt-get clean

RUN R -e "install.packages('devtools'); \
          source('https://bioconductor.org/biocLite.R'); \
          devtools::install_github('zwdzwd/sesame',ref='1082d17'); \
          library(sesame)"

ENV SESAME 00.01.08
