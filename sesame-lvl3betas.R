#!/usr/bin/env Rscript

library(sesame)

#    Take a folder and IDAT R/G basename from command line and return the beta values
#    @param argv[0]: the folder containing the R&G IDAT files
#    @param argv[1]: the basename for the R&G IDAT files
#    @return file containing the beta values

args = commandArgs(trailingOnly=TRUE)
sset <- readIDATs(paste0(args[1],args[2]))[[1]]
sset.nb <- noob(sset)
sset.db <- dyeBiasCorrTypeINorm(sset.nb)
level3.betas <- getBetas(sset.db)
write.table(level3.betas,file=paste0(args[2],"-level3betas-gdcrerun.txt"),col.names = FALSE,quote = FALSE,sep = '\t')