library(xts)
library(quantmod)
library(tseries)
library(shiny)
library(shinydashboard)
source("stock_charts.R")

server <- function(input, output, session){
  # Fetch yahoo finance data
  stockData<-reactive({
    getSymbols(input$Quote, src = "yahoo", 
               from = input$startDate,
               to = input$endDate,
               auto.assign = FALSE)
  })
  
  # Draw candle plot
  output$CandlePlot <- renderPlotly({
    plotlyCandleStick(stockData(), input$Quote)
  })
  
}