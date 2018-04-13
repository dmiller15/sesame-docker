FROM r-base

MAINTAINER Daniel P. Miller <dmiller15@uchicago.edu>

RUN apt-get install libcurl4-openssl-dev libssl-dev

RUN R -e "install.packages('devtools', repos = 'http://cran.us.r-project.org')" 

ENV SESAME 00.01.01
