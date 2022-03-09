# load packages 
library("shiny")

# load data
min_wage_data <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-sarah02mun/main/data/Minimum-Wage-Data.csv", 
                          stringsAsFactors = FALSE)

  
# sidebar content for chart 1
chart1_sidebar_content <- sidebarPanel(
  sliderInput(
    inputId = "year_chart_1",
    label = "Year to map",
    min = 1968,
    max = 2020,
    value = 2020,
    step = 1,
    sep = ''
  )
)

# main content for chart 1
chart1_main_content <- mainPanel(
  plotlyOutput("map")
)

# tab panel for chart 1
chart1_panel <- tabPanel(
  "Map",
  titlePanel("US State Minimum Wages"), 
  sidebarLayout(
    chart1_sidebar_content,
    chart1_main_content
  )
)

# sidebar content for chart 2
chart2_sidebar_content <- sidebarPanel(
  radioButtons(
    inputId = "dollars",
    label = "Dollar Conversion:",
    choices = c("By year",
                "2020 dollars")
  )
)

# main content for chart 2
chart2_main_content <- mainPanel(
  plotlyOutput("line"))

# tab panel for chart 2
chart2_panel <- tabPanel(
  "Line Chart",
  titlePanel("Federal Minimum Wage vs. CPI Over Time"),
  fluidPage(
    p("This chart attempts to answer the question of how federal minimum wage 
  compares to CPI average over time. From this we can see how the cost of 
  living has changed over time and understand how the minimum wage affects 
  consumers' ability to pay for goods and services.")
  ),
  sidebarLayout(
    chart2_sidebar_content,
    chart2_main_content
  )
)

# sidebar content for chart 3
chart3_sidebar_content <- sidebarPanel(
  selectInput(inputId = "Statemw", 
              label = "State:",
              choices = min_wage_data$State

  )

)

# main content for chart 3
chart3_main_content <- mainPanel(
  plotlyOutput("scatterplot"))


# tab panel for chart 3
chart3_panel <- tabPanel(
  "Scatter Plot",
  titlePanel("Change In State Minimum Wage"),
  fluidPage(
    p("This chart is a scatter plot that demonstrates the change in state minimum wage in each state 
      in the United States since 1968. State can be selected from the box on the left. Once selected, 
      state minimum wage from 1968 to 2020 will be shown on the right through scatter plot with x-axis 
      that represents year and y-axis that represents state minimum wage."),
  sidebarLayout(
    chart3_sidebar_content,
    chart3_main_content
  )
)
)


# tab panel for introduction
intro_panel <- tabPanel( 
  "Introduction",
  titlePanel("Introduction"),
  #fluidPage(
    img("alt text", src = "https://familymedicine.uw.edu/wp-content/uploads/2015/07/Sunset_seattle-1024x770.jpg"),
    p("The minimum wage varies across the United States. It has re-entered the forefront of policy discourse as federal and state proposals range from as low as $7.25 to as high as $17.25. The federal minimum wage has remained stagnant for several
years; however, the state-level minimum wage has changed frequently over time. High state-level minimum wages are related to local economic conditions or the standard of living in that state. The change in minimum wage generates variation 
in the consumer price index and allows us to identify the relationship between the minimum wage changes and inflation, as well as the consumption growth."),
    
    
    p("Our project studies the changes in minimum wage at the state and federal level. We conducted our research using a dataset titled, U.S. Minimum Wage by State from 1968 to 2020, from Kaggle.
Through this dataset, we were able to examine how the changes in minimum wage affects the consumer index price (CPI). We mainly focused on data collected in 2020 related to the average CPI, federal minimum wage, and 
and state minimum wage to answer our research questions."),
    
    
    h3("Research Questions"),
    
    p("How has the US states' minimum wage changed over time?"),
    p("How has the federal minimum wage changed compared to consumer price index over time?"),
    p("How does the ratio of the US states' minimum wage to consumer price index change over time?"),
    
    p("Our data analysis answered our research questions and our findings are shown through different types of charts."),
    
 # )
)


# tab panel for summary
summary_panel <- tabPanel( 
  "Summary",
  titlePanel("Summary")
)


# tab panel for report
report_panel <- tabPanel( 
  "Report",
  fluidPage(
    includeMarkdown('../docs/report.md')
  )
)

# Define a variable `ui` storing a `navbarPage()` element containing
# your two pages defined above
ui <- navbarPage(
  "Analyzing US Minimum Wage Trends",
  intro_panel,
  chart1_panel,
  chart2_panel,
  chart3_panel,
  summary_panel,
  report_panel
)
