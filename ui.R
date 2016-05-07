library(shinydashboard)

dashboardPage(
  dashboardHeader(title = "Stock Viewer"),
  ## Sidebar Content
  dashboardSidebar(
    sidebarMenu(
      menuItem("Stock Charts", tabName = "stock", icon = icon("dashboard")),
      menuItem("Trends View", tabName = "trend", icon = icon("bar-chart")),
      menuItem("Historical Data", tabName = "data", icon = icon("table"))
    )
  ),
  ## Body Content
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "stock",
              fluidRow(
                # Main panel to show plot
                column(
                  width = 9 ,
                  box(plotlyOutput("CandlePlot", width = "100%", height = "80%"),
                      width = NULL,
                      height = 480,
                      background = "black",
                      solidHeader = TRUE)
                ),
                
                # Right handside widgets
                column(
                  width = 3,
                  box(
                    title = "Controls",
                    width = NULL,
                    solidHeader = TRUE,
                    textInput(inputId = "Quote", 
                              label = "Symbol",
                              value = "^GSPC"),
                    dateInput(inputId = "startDate",
                              label = "Start Date",
                              min = "1970-01-01",
                              max = Sys.Date()-1,
                              value = "2015-01-01"
                    ),
                    dateInput(inputId = "endDate",
                              label = "End Date",
                              min = "1970-01-02",
                              max = Sys.Date(),
                              value = Sys.Date()
                    )
                  )
                )
              )),
      
      # Second tab content
      tabItem(tabName = "trend"),
      
      # Third tab content
      tabItem(tabName = "data")
    )
  )
)