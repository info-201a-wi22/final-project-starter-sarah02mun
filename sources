# Load packages
library(dplyr)
library(tidyverse)
library(ggplot2)

# Set working directory
setwd("~/Desktop/INFO-201-coding/final-project-starter-sarah02mun/data")

# Load data
min_wage_data <- read.csv("Minimum-Wage-Data.csv", stringsAsFactors = FALSE)

# Filter the data to get the minimum wage for Washington state and the CPI
df <- min_wage_data %>%
  filter(State == "Washington") %>%
  select(Year, State.Minimum.Wage.2020.Dollars, CPI.Average)

# Make a line plot
ggplot() +
  geom_line(data = df, aes(x = Year, y = CPI.Average), color = "blue") +
  geom_line(data = df, aes(x = Year, y = State.Minimum.Wage.2020.Dollars), color = "red") + 
  xlab("Year") + 
  ylab("$")
