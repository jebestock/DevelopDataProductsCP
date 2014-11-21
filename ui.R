# Creation of Shiny UI for Stock Prices and Investment Trials

shinyUI(pageWithSidebar(
        headerPanel("Stock Selection and Portfolio Variability"),
        sidebarPanel(
                selectInput("stock", "Stock:",
                            list("BA",
                                 "CAT",
                                 "CSCO",
                                 "DIS",
                                 "GE",
                                 "GS",
                                 "IBM",
                                 "INTC",
                                 "JNJ",
                                 "PFE",
                                 "XOM")),
                numericInput('amount', 'Number of stocks to be purchased:', 
                             10, min = 1, step = 1),
                numericInput('days', 'Date of purchase?
                             Give purchase date in number of days back in time from yesterday !', 
                             100, min = 1, max = 10000, step = 1),
                submitButton("Submit"),
                p("Documentation:",a("LinkToHelp",href="Help.html"))
        ),
        mainPanel(
                h3('Portfolio value'),
                h4("Chosen Stock"),
                verbatimTextOutput("o_stock"),
                h4("Number of stocks invested"),
                verbatimTextOutput("o_amount"),
                h4("Initial value of investment at purchase date in USD"),
                verbatimTextOutput("amount_init"),
                h4 ("Value of investment as of closing time yesterday in USD"),
                verbatimTextOutput("amount_now"),
                h4 ("Profit/Loss in Percent"),
                verbatimTextOutput("percentage"),
                plotOutput('myplot')  

        )
))
