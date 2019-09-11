#**************************************************************************
# Title: connect_ECLSK1998.R
# Author: William Murrah
# Description:
# Created: Friday, 06 September 2019
# R version: R version 3.6.1 (2019-07-05)
# Directory: /home/wmmurrah/Projects/QMER/IntroEdSurveyData
#**************************************************************************
# packages used -----------------------------------------------------------
library(EdSurvey)  


eclsk <- readECLS_K1998("~/Dropbox/Data/ECLS_K/1998")

d <- getData(eclsk, c("childid", "gender", "race"))
