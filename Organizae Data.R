library(tidyr)
library(dplyr)
setwd("C:/Users/iwilli11/Desktop/Algorithms/Data/Football_Practice/nfl_data")
nfl_data = read.csv('nfl_direction1.csv')



## Read in Data
nfl_data1 <- read.csv("nfl_direction1.csv")
## Number of Outcomes is 3582
#dim(nfl_data1) 


## Get rid of NA outcomes
nfl_data2 <- nfl_data1 %>% filter(is.na(Outcome)==F)
## Number of Outcomes is 3270 that did not have a tie at the end of the game
# dim(nfl_data2) 


## Make Home or Away binary (1:Home,0:Away)
nfl_data3 <- nfl_data2 %>% mutate(HomeOrAwayBin = ifelse(HomeORAway =="H",1,0))

## Analysis dataset, remove non-important variables
nfl_data4 <- nfl_data3 %>% select(-Team,-HomeORAway)


## Create Train and Test Data sets
nfl_data5 <- modelr::resample_partition(nfl_data4, c(test = 0.2, train = 0.8))
train_nfl_data5 <- as.data.frame(nfl_data5$train) 
test_nfl_data5  <- as.data.frame(nfl_data5$test)