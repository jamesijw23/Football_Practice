library(dplyr)
load("nfldata.rda")

############
## Wrangle Data to Obtain ML - Workable DFs
############


##-----------------------------------
## Obtain only Redskins
##-----------------------------------

red = pbp_data %>%
  filter(HomeTeam == "WAS" |AwayTeam =="Was")
