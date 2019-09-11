#**************************************************************************
# Title: import_naep.R
# Author: William Murrah
# Description:
# Created: Friday, 06 September 2019
# R version: R version 3.6.1 (2019-07-05)
# Directory: /home/wmmurrah/Projects/QMER/IntroEdSurveyData
#**************************************************************************
# packages used -----------------------------------------------------------
library(EdSurvey)  

sdf <- readNAEP(system.file("extdata/data", "M36NT2PM.dat", package = "NAEPprimer"))

names(sdf)

searchSDF("race", data = sdf, fileFormat = "student")
edsurveyTable(~ sdracem, data = sdf)


lm1 <- lm.sdf(composite ~ dsex + b017451, data = sdf)
summary(lm1)
texreg::screenreg(lm1)

cor_pearson <- cor.sdf("b013801", "t088001", data = sdf, 
                       method = "Pearson", weightVar = "origwt")
cor_pearson
