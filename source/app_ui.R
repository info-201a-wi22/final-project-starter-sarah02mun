# load packages 
library("shiny")

# source files
source("tabs/tab_panel_chart_2.R")

# sidebar content for chart 1
chart1_sidebar_content <- sidebarPanel()

# main content for chart 1
chart1_main_content <- mainPanel()

# tab panel for chart 1
chart1_panel <- tabPanel(
  "Chart 1",
  titlePanel("Chart 1"), 
  sidebarLayout(
    chart1_sidebar_content,
    chart1_main_content
  )
)

# sidebar content for chart 2
chart2_sidebar_content <- sidebarPanel()

# main content for chart 2
chart2_main_content <- mainPanel()

# tab panel for chart 2
chart2_panel <- tabPanel(
  "Chart 2",
  titlePanel("Chart 2"), 
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

# main panel for introduction
intro_main_content <- mainPanel()

# tab panel for introduction
intro_panel <- tabPanel( 
  "Introduction",
  titlePanel("Introduction"),
  intro_main_content
) 

# main panel for summary
summary_main_content <- mainPanel()

# tab panel for summary
summary_panel <- tabPanel( 
  "Summary",
  titlePanel("Summary"),
  intro_main_content
)

# main panel for report
report_main_content <- mainPanel()

# tab panel for report
report_panel <- tabPanel( 
  "Report",
  titlePanel("Report"),
  intro_main_content
)

# Define a variable `ui` storing a `navbarPage()` element containing
# your two pages defined above
ui <- navbarPage(
  "Final Deliverable",
  intro_panel,
  chart1_panel,
  chart2_panel,
  chart3_panel,
  summary_panel,
  report_panel
)