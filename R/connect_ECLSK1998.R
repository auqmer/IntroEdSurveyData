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
library(ggplot2)
library(data.table)
eclsk <- readECLS_K1998("~/Dropbox/Data/ECLS_K/1998")

d <- getData(eclsk, c("childid", "gender", "race"))
names(eclsk$dataList$Data)

math.search <- searchSDF("math IRT", eclsk)
searchSDF("grade", eclsk)
searchSDF("age", eclsk)
mathdf <- getData(eclsk, varnames = c("childid", "gender" ,"race",
                                      "c1r4mscl", "c2r4mscl",  
                                      "c4r4mscl", "c5r4mscl",
                                      "c6r4mscl", "c7r4mscl",
                                      "r1_kage", "r2_kage",
                                      "r4age", "r5age", 
                                      "r6age", "r7age"))
# Rename variables.
names(mathdf) <- c("childid", "gender", "race", "0_math", "1_math", "2_math", 
              "4_math", "6_math", "9_math", "0_age", "1_age", "2_age",
              "4_age", "6_age", "9_age")

mathdt <- setDT(mathdf)

mathdt <- melt(mathdt, id.vars = c("childid", "gender", "race"),
               measure.vars = list(c("0_math", "1_math", "2_math", "4_math",
                                "6_math", "9_math"), 
                                c("0_age", "1_age", "2_age",
                                  "4_age", "6_age", "9_age")),
               value.name = "mathIRT" )

mathdt[, c("time", "subject") := tstrsplit(variable, "_", fixed=TRUE)]

mathdt[,"variable" := NULL]

mathdt[, "time" := as.numeric(time)]

# Growth in math ability as a function of grade.
ggplot(mathdt, aes(time, mathIRT, group = childid)) + geom_point(alpha = .06) +
  geom_line(alpha = .06)
