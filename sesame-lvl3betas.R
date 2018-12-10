#!/usr/bin/env Rscript

library(sesame)
library(jsonlite)

#    Take a folder and IDAT R/G basename from command line and return the beta values
#    @param argv[0]: the folder containing the R&G IDAT files
#    @param argv[1]: the basename for the R&G IDAT files
#    @return file containing the beta values

args = commandArgs(trailingOnly=TRUE)
sset <- readIDATpair(paste0(args[1],args[2]))
sset.nb <- noob(sset)
sset.db <- dyeBiasCorrTypeINorm(sset.nb)
isex <- inferSex(sset.db)
ieth <- inferEthnicity(sset.db)
level3.betas <- getBetas(sset.db)
ageHorv <- predictAgeHorvath353(level3.betas)
ageSkBl <- predictAgeSkinBlood(level3.betas)
agePhen <- predictAgePheno(level3.betas)
metadata <- data.frame(args[2],isex,ieth,ageHorv,ageSkBl,agePhen)
colnames(metadata) <- c("sample","inferredSex","inferredEthnicity","predictAgeHorvath","predictAgeSkinBlood","predictAgePhenotype")
outputName = paste0(args[2],"-sesame-gdc-meta.json")
write(toJSON(metadata,pretty=TRUE),outputName)
write.table(level3.betas,file=paste0(args[2],"-level3betas-gdc.txt"),col.names = FALSE,quote = FALSE,sep = '\t')
