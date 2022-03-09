#load packages
library("tidyverse")
library("leaflet")
library("plotly")

#set wd
#setwd("C:/Users/viann/OneDrive/Desktop/INFO-201/final-project-starter-sarah02mun/data")

#load data
min_wage_data <- read.csv("Minimum-Wage-Data.csv", stringsAsFactors = FALSE)

#filter data to get minimum wage of all states in 2020
df <- min_wage_data %>%
  filter(Year==2020) %>%
  arrange(State) 
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
df$hover <- with(df, paste(State, '<br>',
                           "Mininum Wage in 2020:", State.Minimum.Wage))

fig <- plot_geo(df, locationmode = 'USA-states')
fig <- fig %>% add_trace(
  z = ~State.Minimum.Wage, text = ~hover, locations = ~code,
  color = ~State.Minimum.Wage, colors = "Purples"
)
fig <- fig %>% colorbar(title = "Dollars USD")
fig <- fig %>% layout(
  title = "2020 US State Minimum Wages<br>(Hover for breakdown)",
  geo = g
)


