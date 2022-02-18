library("dplyr")

min_wage_data <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-sarah02mun/main/data/Minimum-Wage-Data.csv", stringsAsFactors = FALSE)

#What is the ratio of state minimum wage to CPI for each state in 2020?
state_min_wage_to_CPI <- min_wage_data %>%
  group_by(State) %>%
  filter(Year == 2020) %>%
  summarize(State.Minimum.Wage.To.CPI = (State.Minimum.Wage / CPI.Average)) %>%
  arrange(-State.Minimum.Wage.To.CPI)

  



