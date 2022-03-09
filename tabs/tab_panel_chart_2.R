# Load packages
library(shiny)
library(ggplot2)
library(plotly)
library(dplyr)

source("chart2.R")

## TAB CODE
fed_min_wage <- min_wage_data %>%
  group_by(Year) %>%
  summarise(Federal.Minimum.Wage = mean(Federal.Minimum.Wage), 
            Federal.Minimum.Wage.2020.Dollars = mean(Federal.Minimum.Wage.2020.Dollars),
            CPI.Average = mean(CPI.Average))

