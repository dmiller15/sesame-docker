FROM r-base
ENV SESAME 00.01.00

MAINTAINER Daniel P. Miller <dmiller15@uchicago.edu>

RUN R -e "install.packages('devtools', repos = 'http://cran.us.r-project.org')" 
