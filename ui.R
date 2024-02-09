library(shiny)
library(tidyverse)
library(plotly)

fluidPage(

    # Application title
    titlePanel("SP400 Tickers"),

    sidebarLayout(
        sidebarPanel(
            selectInput("userticker",
                        "Choose a ticker:",
                        choices = tickers),
        ),
        mainPanel(
            plotlyOutput("distPlot")
        )
    )
)
