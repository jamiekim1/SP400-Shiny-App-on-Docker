p <- c("tidyquant", "plotly", "devtools", "tidyverse", "shiny", "ggplot2",
       "learnr", "magrittr", "rlang", "lifecycle", "glue")

new.packages <- p[!(p %in% installed.packages()[, "Package"])]
if (length(new.packages)) {
  install.packages(new.packages, dependencies = TRUE)
}

devtools::install_github("risktoollib/RTL")
devtools::install_github("risktoollib/RTLedu")
