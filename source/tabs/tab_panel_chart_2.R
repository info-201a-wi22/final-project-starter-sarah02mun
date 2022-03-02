# Load packages
library(shiny)
library(ggplot2)
library(plotly)

source("../chart2.R")

## TAB CODE

# Description of chart
fluidRow(
  column(
    12,
    h1("Comparing CPI and WA Minimum Wage"),
    p("The purpose of this chart is to show how the minimum wage of Washington",
      "changes in relation to the average CPI between the years of 1968 and",
      "2020. This chart is important because it shows how the prices of goods",
      "continue to increase while the minimum wage stays at a relatively low",
      "value. Since the CPI is reflective of the U.S. rise in inflation, we can",
      "use this chart to understand how this gap in minimum wage and CPI",
      "affects consumer spending. One notable observation is that the CPI is",
      "far higher than the minimum wage in Washington for all years. This shows",
      "that those receiving minimum wage may not be able to afford goods as the",
      "price inflates, thus demonstrating a need for higher wages.")
  )
)

# Sidebar content
chart2_sidebar_content <- sidebarPanel(
  h1("Controls for Year"),
  selectInput(
    inputId = "year",
    label = "Year to compare",
    selected = NULL,
    choices = 1968:2020
  )
)

# Main content
chart2_main_content <- mainPanel(
  h1("Chart 2: CPI Average v. WA Minimum Wage"),
  plotOutput("line_plot"))

# Tab panel
chart2_panel <- tabPanel(
  "Chart 2",
  titlePanel("Chart 2"), 
  sidebarLayout(
    chart2_sidebar_content,
    chart2_main_content
  )
)