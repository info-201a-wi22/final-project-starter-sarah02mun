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

chart_2 <- ggplot(fed_min_wage) + 
  geom_line(mapping = aes(x = Year, y = Federal.Minimum.Wage, color = "Federal Minimum Wage")) + 
  geom_line(mapping = aes(x = Year, y = CPI.Average, color = "CPI")) + 
  labs(
    x = "Year",
    y = "Federal Minimum Wage",
    title = "Comparing Federal Minimum Wage to CPI"
  ) +
  scale_color_manual(
    name = "Legend",
    values = c("Federal Minimum Wage" = "blue", "CPI" = "red")
  )

chart_2

# Chart description
p("This chart attempts to answer the question of how federal minimum wage 
  compares to CPI average over time. From this we can see how the cost of 
  living has changed over time and understand how the minimum wage affects 
  consumers' ability to pay for goods and services.")
