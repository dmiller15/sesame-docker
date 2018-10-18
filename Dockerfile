FROM r-base:3.4.4 

MAINTAINER Daniel P. Miller <dmiller15@uchicago.edu>

RUN apt-get update -qq && \
    apt-get install -y libssl-dev libcurl4-openssl-dev libssh2-1-dev libxml2-dev && \
    apt-get clean

RUN R -e "install.packages('devtools'); \
          source('https://bioconductor.org/biocLite.R'); \
          devtools::install_github('zwdzwd/sesame',ref='1082d17')
          Sys.setenv(SESAMEHOME='/home/docker/sesame-refs/')
          sesame::cacheBuiltInData()"

ADD sesame-lvl3betas.R /home/docker

ENV SESAME 01.00.01
