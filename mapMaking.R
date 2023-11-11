##################
# Load libraries #
##################
library(usmap)      #Author: Paolo Di Lorenzo https://usmap.dev
library(ggplot2)    #Author: Hadley Wickham et.al. 	https://ggplot2.tidyverse.org, https://github.com/tidyverse/ggplot2
library(maps)       #Author: Original S code by Richard A. Becker and Allan R. Wilks. R version by Ray Brownrigg. Enhancements by Thomas P Minka and Alex Deckmyn. https://CRAN.R-project.org/package=maps

####################
# Create Variables #
####################
startDate <- '2021-01-01'
endDate <- '2021-12-31'


#################################
# Load Covid Data and Fips Data #
#################################
covidData <- read.csv("~/Scripts/R/COVIDDeathData.csv")
fipsData <- read.csv("~/Scripts/R/fips_county.csv")

###############################
# Choose range for Covid Data #
###############################
covidData <- covidData[covidData$Onset.Date >= startDate & covidData$Onset.Date <= endDate,]

##############################
# Add values for each County #
##############################
moredata <- setNames(aggregate(x = covidData$Case.Count,       #specify the data column
                       by= list(covidData$County),             #specify the grouping
                       FUN = sum),                             #specify the function
                      c("County","Cases"))                     #add titles for the columns using setNames

#################################
# Combine fips and covid tables #
#################################
combinedData <- merge(x = moredata, y = fipsData, by = "County")

#################
# Plot Heat Map #
#################
plot_usmap(regions = "counties", data = combinedData, color = "red", values = "Cases", labels = FALSE) +
  scale_fill_continuous(name = "Covid Cases", label = scales::comma, low = "green", high = "red") +
  labs(title = "Ohio", subtitle = "Counties") +
  theme(legend.position = "left")

ggplot(combinedData, aes(Cases,fips, color = class))+
  geom_point()