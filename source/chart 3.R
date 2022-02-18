# Load packages
library(dplyr)
library(tidyverse)
library(ggplot2)


# Load data
min_wage_data <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-sarah02mun/main/data/Minimum-Wage-Data.csv", stringsAsFactors = FALSE)


min_wage_wa <- min_wage_data %>% filter(State == "Washington")%>% select(Year, State, State.Minimum.Wage)



scatter_plot <- ggplot(data = min_wage_data) + geom_point(mapping = aes(x = Year, y = State.Minimum.Wage)) + facet_wrap(~State)

