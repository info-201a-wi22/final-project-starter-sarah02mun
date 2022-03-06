#load packages
library("tidyverse")
library("plotly")


build_map <- function(data, year) {
  #filter data to get minimum wage of all states in year
  df <- data %>%
    filter(Year==!!year)
  
  #keep only US states
  df <- df[-c(9, 12, 42, 47), ]
  df <- df %>% mutate(
    code = setNames(state.abb, state.name)[State]
  )
  
  # give state boundaries a white border
  l <- list(color = toRGB("white"), width = 2)
  
  # specify some map projection/options
  g <- list(
    scope = 'usa',
    projection = list(type = 'albers usa'),
    showlakes = TRUE,
    lakecolor = toRGB('white')
  )
  
  #create map plot centered on the US
  fig <- plot_geo(df, locationmode = 'USA-states')
  fig <- fig %>% add_trace(
    z = ~State.Minimum.Wage, locations = ~code,
    color = ~State.Minimum.Wage, colors = "Purples"
  )
  fig <- fig %>% colorbar(title = "Dollars USD")
  fig <- fig %>% layout(
    title = paste0("US State Minimum Wages in ", year),
    geo = g
  )
}
