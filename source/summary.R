#load packages
library("dplyr")

#set wd
setwd("~/Desktop/INFO-201-coding/final-project-starter-sarah02mun/data")

#load dataset
min_wage_data <- read.csv("Minimum-Wage-Data.csv",
                            stringsAsFactors = FALSE)
#summary list
summary_info <- list()

#Washington state minimum wage over time
summary_info$wa_min_wage <- min_wage_data %>%
  filter(State=="Washington") %>% 
  select(State.Minimum.Wage)

#Federal minimum wage over time
summary_info$fed_min_wage <- min_wage_data %>% 
  group_by(Year) %>% 
  summarize(fed_min_wage = mean(Federal.Minimum.Wage)) %>%
  select(fed_min_wage)
  
#Consumer price index over time
summary_info$avg_cpi <- min_wage_data %>% group_by(Year) %>% 
  summarize(CPI = mean(CPI.Average)) %>% 
  select(CPI)

#Ratio of Washington state minimum wage to CPI over time
summary_info$wa_min_wage_to_cpi <- summary_info$wa_min_wage/summary_info$avg_cpi

#Ratio of Federal minimum wage to CPI over time
summary_info$fed_min_wage_to_cpi <- summary_info$fed_min_wage/summary_info$avg_cpi
