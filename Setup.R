pacotes <- c("forecast", "magrittr", "tidyverse", "GGally", "broom", "ggalt",
             "ggExtra", "BETS", "lubridate", "seasonal", "mafs", "dygraphs",
             "gtrendsR")

install.packages(pacotes)


energia <- BETSget(1404)
saveRDS(energia, "data/ts_energia.Rda")