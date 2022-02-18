library("dplyr")

min_wage_data <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-sarah02mun/main/data/Minimum-Wage-Data.csv", stringsAsFactors = FALSE)

#View (min_wage_data)

#What is the average minimum wage of all 50 states in each year
get_table <- min_wage_data %>%
  group_by(Year) %>%
  summarize(avg_min_wage = mean(State.Minimum.Wage))
  



