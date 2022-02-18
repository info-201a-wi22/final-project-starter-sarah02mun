#load packages
library("dplyr")

#load dataset
min_wage_data <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-sarah02mun/main/data/Minimum-Wage-Data.csv",
                            stringsAsFactors = FALSE)
#summary list
summary_info <- list()

#Ratio of state minimum wage to Average CPI for Washington State in 2020
summary_info$wa_min_wage_to_cpi <- min_wage_data %>%
  filter(State=="Washington") %>% 
  filter(Year==2020) %>%
  mutate(Minimum.Wage.To.CPI = State.Minimum.Wage / CPI.Average) %>%
  pull(Minimum.Wage.To.CPI)

#Ratio of state minimum wage to Average CPI for Texas in 2020
summary_info$tx_min_wage_to_cpi <- min_wage_data %>%
  filter(State=="Texas") %>% 
  filter(Year==2020) %>%
  mutate(Minimum.Wage.To.CPI = State.Minimum.Wage / CPI.Average) %>%
  pull(Minimum.Wage.To.CPI)
  
#Ratio of state minimum wage to Average CPI for Alabama in 2020
summary_info$al_min_wage_to_cpi <- min_wage_data %>%
  filter(State=="Alabama") %>% 
  filter(Year==2020) %>%
  mutate(Minimum.Wage.To.CPI = State.Minimum.Wage / CPI.Average) %>%
  pull(Minimum.Wage.To.CPI)

#Ratio of state minimum wage to Average CPI for Michigan in 2020
summary_info$mi_min_wage_to_cpi <- min_wage_data %>%
  filter(State=="Michigan") %>% 
  filter(Year==2020) %>%
  mutate(Minimum.Wage.To.CPI = State.Minimum.Wage / CPI.Average) %>%
  pull(Minimum.Wage.To.CPI)

#Ratio of state minimum wage to Average CPI for New York in 2020
summary_info$ny_min_wage_to_cpi <- min_wage_data %>%
  filter(State=="New York") %>% 
  filter(Year==2020) %>%
  mutate(Minimum.Wage.To.CPI = State.Minimum.Wage / CPI.Average) %>%
  pull(Minimum.Wage.To.CPI)

#Ratio of federal minimum wage to Average CPI in 2020
summary_info$fed_min_wage_to_cpi <- min_wage_data %>%
  filter(Year==2020) %>%
  filter(State=="Alabama") %>% #Federal minimum wage is the same for all 50 states, so just grab one row
  mutate(Federal.Minimum.Wage.To.CPI = Federal.Minimum.Wage / CPI.Average) %>%
  pull(Federal.Minimum.Wage.To.CPI)
