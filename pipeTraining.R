####################
# Import Libraries #
####################
library(magrittr)

#####################
# Import Covid Data #
#####################
covidData <- read.csv("~/Scripts/R/COVIDDeathData.csv")
######################################################
# Narrow data down to specific regions or age groups #
######################################################
covidUpdate <-
  covidData %>%
    subset(County == "Franklin") %>%
    subset(Age.Range == "30-39")
sum(covidUpdate$Case.Count)     #total all that match this criteria
