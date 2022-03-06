# load packages
library("shiny")

# load data
min_wage_data <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-sarah02mun/main/data/Minimum-Wage-Data.csv", 
                          stringsAsFactors = FALSE)

# source files
source("tabs/tab_panel_chart_1.R")


server <- function(input, output) {
  # display chart 1
  output$map <- renderPlotly({ 
    return(build_map(min_wage_data, input$year_chart_1))
  })
  
}
