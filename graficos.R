library(BETS)
library(forecast)
library(lubridate)
library(tidyverse)
library(magrittr)
library(seasonal)

# serie sem sazonalidade ou tendencia
plot(rnorm(200, mean = 0, sd = 1), type = "l", xlab = "Observação", ylab = "")


# serie com sazonalidade e sem tendencia
plot(ldeaths)


# serie com tendencia e sem sazonalidade
x <- 1:500
set.seed(123)
x <- x/50 + rnorm(500)
plot(x, type = "l")


# serie com sazonalidade e tendencia
data("AirPassengers")
plot(AirPassengers)

#decomposição de série temporal
plot(decompose(AirPassengers))


# simulando uma série de modelo aditivo
set.seed(123)
x <- 1:500 + c(rnorm(250, 50, 25), rnorm(250, 50, 25))
plot(x, type = "l")


# modelo multiplicativo
a <- rep(1, 500)
b <- 1:500/8
set.seed(123)
x2 <- pmap(list(a, b), rnorm, mean = 0) %>% as.numeric()
x <- 1:500 + x2
plot(x, type = "l")

#decomposição média móvel
energia <- BETSget(1404)

plot(energia)
ma(energia, 3) %>% lines(col = "red", lwd = 1)

ma(energia, 12) %>% lines(col = "blue", lwd = 2)
ma(energia, 24) %>% lines(col = "green", lwd = 3)


energia %>% decompose() %>% autoplot

#decomposição STL
energia %>% 
  stl(s.window = "periodic") %>% 
  plot

library(tidyverse)
library(forecast)
library(lubridate)

# vamos testar tanto o metodo aditivo quanto o multiplicativo para a serie de exemplo
ajuste_ad <- hw(energia, seasonal = "additive")
ajuste_mult <- hw(energia, seasonal = "multiplicative")


plot(energia)
lines(fitted(ajuste_ad), col = "blue")
lines(fitted(ajuste_mult), col = "red")
