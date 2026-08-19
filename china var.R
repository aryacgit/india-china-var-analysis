library(vars)
library(tseries)
data <- read.csv("var-china-dataset.csv")
# View (data)
data_ts <- ts(data[,2:4], start=1987, frequency=1)
adf.test(data_ts[,1])
adf.test(data_ts[,2])
adf.test(data_ts[,3])
diff_data <- diff(data_ts)
VARselect(diff_data, lag.max=1, type="const")
var_model <- VAR(diff_data, p=1, type="const")
summary(var_model)

# serial correlation
serial.test(var_model)

# heteroskedasticity 
arch.test(var_model)

# normality
normality.test(var_model)

# stability
roots(var_model)

# granger causality 
causality(var_model, cause="trade.openness")

irf_trade_openness<-irf(var_model, impulse="trade.openness", response="trade.openness", n.ahead=10)
plot(irf_trade_openness)

irf_interest<-irf(var_model, impulse="interest", response="trade.openness", n.ahead=10)
plot(irf_interest)

irf_inflation<-irf(var_model, impulse="inflation", response="trade.openness", n.ahead=10)
plot(irf_inflation)

irf_1 <- irf(var_model, impulse="trade.openness", response="inflation", n.ahead=10)
plot(irf_1)

irf_2 <- irf(var_model, impulse="trade.openness", response="interest", n.ahead=10)
plot(irf_2)

irf_3<-irf(var_model, impulse="interest", response="inflation", n.ahead=10)
plot(irf_3)

fevd(var_model)
predict(var_model, n.ahead=5)

pred <- predict(var_model, n.ahead = 5)

trade_diff_forecast <- pred$fcst$trade.openness[,1]
lower_diff <- pred$fcst$trade.openness[,2]
upper_diff <- pred$fcst$trade.openness[,3]

# Data Type
last_value <- as.numeric(tail(data_ts[,1], 1))

#
trade_forecast <- last_value + cumsum(trade_diff_forecast)
lower <- last_value + cumsum(lower_diff)
upper <- last_value + cumsum(upper_diff)

end_year <- end(data_ts)[1]
time_future <- seq(end_year + 1, end_year + 5)

plot(data_ts[,1],
     xlim = c(start(data_ts)[1], end_year + 5),
     ylim = range(c(data_ts[,1], lower, upper)),
     main = "Trade Openness Forecast",
     ylab = "Trade Openness",
     xlab = "Year")

lines(time_future, trade_forecast, lty = 2)
points(time_future, trade_forecast)

lines(time_future, lower, lty = 3)
lines(time_future, upper, lty = 3)


# inflation
# Extract forecasted DIFFERENCES
infl_diff_forecast <- pred$fcst$inflation[,1]
infl_lower_diff <- pred$fcst$inflation[,2]
infl_upper_diff <- pred$fcst$inflation[,3]

# Last actual value
infl_last <- as.numeric(tail(data_ts[,2], 1))

# Convert to levels
infl_forecast <- infl_last + cumsum(infl_diff_forecast)
infl_lower <- infl_last + cumsum(infl_lower_diff)
infl_upper <- infl_last + cumsum(infl_upper_diff)

# Plot
plot(data_ts[,2],
     xlim = c(start(data_ts)[1], end_year + 5),
     ylim = range(c(data_ts[,2], infl_lower, infl_upper)),
     main = "Inflation Forecast",
     ylab = "Inflation",
     xlab = "Year")

lines(time_future, infl_forecast, lty = 2)
points(time_future, infl_forecast)

lines(time_future, infl_lower, lty = 3)
lines(time_future, infl_upper, lty = 3)


# Interest rate 
# Extract forecasted DIFFERENCES
int_diff_forecast <- pred$fcst$interest[,1]
int_lower_diff <- pred$fcst$interest[,2]
int_upper_diff <- pred$fcst$interest[,3]

# Last actual value
int_last <- as.numeric(tail(data_ts[,3], 1))

# Convert to levels
int_forecast <- int_last + cumsum(int_diff_forecast)
int_lower <- int_last + cumsum(int_lower_diff)
int_upper <- int_last + cumsum(int_upper_diff)

# Plot
plot(data_ts[,3],
     xlim = c(start(data_ts)[1], end_year + 5),
     ylim = range(c(data_ts[,3], int_lower, int_upper)),
     main = "Interest Rate Forecast",
     ylab = "Interest Rate",
     xlab = "Year")

lines(time_future, int_forecast, lty = 2)
points(time_future, int_forecast)

lines(time_future, int_lower, lty = 3)
lines(time_future, int_upper, lty = 3)