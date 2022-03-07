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
  sidebarLayout(
    chart2_sidebar_content,
    chart2_main_content
  )
)

# sidebar content for chart 3
chart3_sidebar_content <- sidebarPanel()

# main content for chart 3
chart3_main_content <- mainPanel()

# tab panel for chart 3
chart3_panel <- tabPanel(
  "Chart 3",
  titlePanel("Chart 3"), 
  sidebarLayout(
    chart3_sidebar_content,
    chart3_main_content
  )
)


# tab panel for introduction
intro_panel <- tabPanel( 
  "Introduction",
  titlePanel("Introduction"),
  fluidPage(
    tags$img(src = "../docs/Minimum-Wage.jpg")
  )
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
    includeMarkdown('../docs/p01-proposal.md')
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
