# Creation of Shiny Server

# Load libraries required

library(shiny)
library(shinyapps)
library(quantmod)
library(xts)

# Create function for reading stock quotes from yahoo finance and 
# computation of portfolio value

PortfolioValue <- function(stockStr,numberStocks,daysBack){
        stockQuotes <- getSymbols(stockStr, index.class="Date", auto.assign=FALSE, 
                                  from = Sys.Date()-daysBack,
                                  to   = Sys.Date())
        #value <- as.numeric(numberStocks*stockQuotes[,4]) 
        value <- xts(numberStocks*stockQuotes[,4]) # take closing prices
        return(value)
}

#

# Create Shiny Server function with input and in interactive plot

shinyServer(
        function(input, output) {
            output$o_stock     <- renderPrint({input$stock})
            output$o_amount    <- renderPrint({input$amount})
            TimeSeries         <- reactive({PortfolioValue(input$stock,input$amount,input$days)})
           
            output$amount_init <- renderPrint({TimeSeries()[[1]]})
            output$amount_now  <- renderPrint({TimeSeries()[[length(TimeSeries()[])]]})
            output$percentage  <- renderPrint({100*(TimeSeries()[[length(TimeSeries()[])]]-TimeSeries()[[1]])/TimeSeries()[[1]]})
            output$myplot <- renderPlot({
                              plot.xts(TimeSeries(),main = "Portfolio Value over Time",
                              type="l",ylab = "USD", xlab = "Days")
                              
                 })
                         
        }
)


