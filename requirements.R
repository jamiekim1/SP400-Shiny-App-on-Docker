p <- c("tidyquant", "plotly", "devtools", "tidyverse", "shiny", "ggplot2")

new.packages <- p[!(p %in% installed.packages()[, "Package"])]
if (length(new.packages)) {
  install.packages(new.packages, dependencies = TRUE)
}

devtools::install_github("risktoollib/RTLedu")
