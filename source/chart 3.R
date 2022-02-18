# Load packages
library(dplyr)
library(tidyverse)
library(ggplot2)
library(plotly)


# Load data
min_wage_data <- read.csv(
  "https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-sarah02mun/main/data/Minimum-Wage-Data.csv", 
  stringsAsFactors = FALSE)


plot_data <- min_wage_data %>% 
  filter(State %in% c("Washington", "Alabama", "New York", "Michigan", "Texas")) %>% 
           select(Year, State, State.Minimum.Wage)



scatter_plot <- ggplot(data = plot_data, mapping = aes(x = Year, y = State.Minimum.Wage)) + 
  geom_point() + 
  facet_wrap(~State) +
  labs( x = "State Minimum Wage",
        y = "Year",
        title = "Change in State Minimum Wages Over Time"
  )

scatter_plot