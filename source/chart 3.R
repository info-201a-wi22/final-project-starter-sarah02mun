# Load packages
library(dplyr)
library(tidyverse)
library(ggplot2)

# Set working directory
setwd("C:/Users/victo/Desktop/final-project-starter-sarah02mun/data")

# Load data
min_wage_data <- read.csv("Minimum-Wage-Data.csv", stringsAsFactors = FALSE)


min_wage_wa <- min_wage_data %>% filter(State == "Washington")%>% select(Year, State, State.Minimum.Wage)



plot <- ggplot(data = min_wage_data) + geom_point(mapping = aes(x = Year, y = State.Minimum.Wage)) + facet_wrap(~State)

plot