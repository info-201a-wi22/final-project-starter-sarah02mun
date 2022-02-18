# Load packages
library(dplyr)
library(tidyverse)
library(tidyr)
library(ggplot2)

# Set working directory


# Load data
min_wage_data <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-sarah02mun/main/data/Minimum-Wage-Data.csv", stringsAsFactors = FALSE)

# Filter the data to get the minimum wage for Washington state and the CPI
df <- min_wage_data %>%
  filter(State == "Washington") %>%
  select(Year, State.Minimum.Wage, CPI.Average)

# Make a line plot
line_plot <- ggplot() +
  geom_line(data = df, aes(x = Year, y = CPI.Average, color = "CPI Average")) +
  geom_line(data = df, aes(x = Year, y = State.Minimum.Wage, color = "WA Minimum Wage")) + 
  labs(
    x = "Year",
    y = "Amount ($)",
    color = "Legend",
    title = "Comparing WA Minimum Wage to CPI Average by Year"
  ) + 
  scale_color_manual(
    name = "Legend",
    values = c("CPI Average" = "blue", "WA Minimum Wage" = "red"))
