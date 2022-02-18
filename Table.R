library("dplyr")

setwd("~/Info-project/final-project-starter-sarah02mun/data")

min_wage_data <- read.csv("Minimum-Wage-Data.csv", stringsAsFactors = FALSE)

#View (min_wage_data)


get_table <- min_wage_data %>%
  group_by(Year) %>%
  summarize(state_min = min(State.Minimum.Wage), state_max = max(State.Minimum.Wage))  %>%
  arrange(desc(state_max)) %>%
  mutate (prop = round((Avg_State.Mimimum.Wage = State.Mimimum.Wage/ nrow(min_wage_data)) * 100))
  
  return (get_table) 


