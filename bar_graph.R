####################
# Import Libraries #
####################
library(ggplot2)  #Author: Hadley Wickham et.al. 	https://ggplot2.tidyverse.org, https://github.com/tidyverse/ggplot2

#####################
# Import Covid Data #
#####################
covidData <- read.csv("~/Scripts/R/COVIDDeathData.csv")

#####################################################
# Aggregate the data totalling the No Death per Day #
#####################################################
dailyTotals <- setNames(aggregate(x = covidData$Deaths,                      #Data
                         by = list(covidData$Date_Of_Death),                 #Grouping
                         FUN = sum),                                         #Function
                        c("Date", "No_Deaths"))                              #Create Column Names


############################################
# Plot bar graph using geom_bar and ggplot #
############################################
ggplot(data = dailyTotals, aes(x = Date,y = No_Deaths)) +
  geom_bar(stat = "identity", color="blue", fill='green')