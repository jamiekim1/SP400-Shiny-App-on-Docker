library(RTLedu)
library(tidyverse)
library(tidyquant)

df <- RTLedu::sp400_desc %>% 
  dplyr::select(symbol, sector, shares_held)

tickers <- sort(unique(df$symbol))

currentprice <- tidyquant::tq_get(tickers,
                                  from = Sys.Date() - 1,
                                  to = Sys.Date(),
                                  get = "stock.prices") %>% 
  dplyr::left_join(df, by = "symbol") %>% 
  dplyr::select(symbol, close, sector, shares_held) %>% 
  dplyr::mutate(mktcap = shares_held * close)


