p <- c("tidyquant", "plotly", "devtools", "tidyverse", "shiny", "ggplot2",
  "learnr", "magrittr", "rlang", "lifecycle", "glue", "dplyr", "httr",
  "jsonlite", "lubridate", "purrr", "readr", "stringr", "tibble", "tidyr",
  "timetk", "tsibble", "xts", "zoo", "Rcpp", "TTR", "tidyselect", "PerformanceAnalytics")

new.packages <- p[!(p %in% installed.packages()[, "Package"])]
if (length(new.packages)) {
  install.packages(new.packages, dependencies = TRUE)
}

if (!requireNamespace("devtools", quietly = TRUE)) {
  install.packages("devtools")
}

devtools::install_github("risktoollib/RTL")
devtools::install_github("risktoollib/RTLedu")
