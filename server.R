library(shiny)
library(tidyverse)
library(tidyquant)
library(plotly)

function(input, output, session) {
  
  sector_selected <- reactive({
    currentprice %>%
      filter(symbol == input$userticker) %>%
      pull(sector)
  })
  
  top3 <- reactive({
    currentprice %>%
      filter(sector == sector_selected()) %>%
      arrange(desc(mktcap)) %>%
      head(3)
  })
  
  output$distPlot <- renderPlotly({
    user_ticker_prices <- tidyquant::tq_get(input$userticker,
                                            from = Sys.Date() - (365 * 5),
                                            to = Sys.Date(),
                                            get = "stock.prices") %>% 
      dplyr::select(symbol, date, close)
    
    top_tickers <- top3() %>% 
      filter(symbol != input$userticker) %>%
      head(2) %>% 
      pull(symbol)
    
    top_tickers_prices <- tidyquant::tq_get(top_tickers,
                                            from = Sys.Date() - (365 * 5),
                                            to = Sys.Date(),
                                            get = "stock.prices") %>% 
      dplyr::select(symbol, date, close)
    
    final <- dplyr::bind_rows(user_ticker_prices, top_tickers_prices)
    
    finalgraph <- final %>%
      ggplot(aes(x = date, y = close, color = symbol)) +
      geom_line() +
      labs(title = paste("Adjusted Price for", input$userticker),
           subtitle = paste("Top 2 stocks by mktcap in", "Sector:", sector_selected()))
    
    ggplotly(finalgraph)
    
  })
}