# load packages
library("shiny")

# load data
min_wage_data <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-sarah02mun/main/data/Minimum-Wage-Data.csv", 
                          stringsAsFactors = FALSE)

# source files
source("tabs/tab_panel_chart_1.R")
source("tabs/tab_panel_chart_2.R")

server <- function(input, output) {
  # display chart 1
  output$map <- renderPlotly({ 
    return(build_map(min_wage_data, input$year_chart_1))
  })
  #display chart 2
  data <- reactive({
    if("By year" %in% input$dollars) return(fed_min_wage$Federal.Minimum.Wage)
    if("2020 dollars" %in% input$dollars) return(fed_min_wage$Federal.Minimum.Wage.2020.Dollars)
  })

  output$line <- renderPlotly({
    ggplot(fed_min_wage) + 
      geom_line(mapping = aes(x = Year, y = data(), color = "Federal Minimum Wage")) + 
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
  })
  
  # Chart 3
  output$scatterplot  <- renderPlotly({
    
    plot_data <- min_wage_data %>% 
      filter(State == input$Statemw) %>% 
      select(Year, State, State.Minimum.Wage)
    
    year_ <- plot_data$Year
    state_minimum <- plot_data$State.Minimum.Wage
    
    scatter_plot <- ggplot(data = plot_data, mapping = aes(x = year_, y = state_minimum)) + 
      geom_point() + 
      labs( x = "State Minimum Wage",
            y = "Year",
            title = "Change in State Minimum Wages Over Time"
      )
    
  })
}
