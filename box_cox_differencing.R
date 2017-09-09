# make each ts non-negative & apply box cox transformation
for ts_index in list
{
	ts <- list[ts_index]
	if sum(ts <0) > 0 
	{ 
		ts_positive <- ts + abs(min(ts)) + 0.01)
		positive_adjustment <- abs(min(ts)) + 0.01
	}
	else 
	{
		ts_postive <- ts 
	}
	# Need to capture the positive modification here

	# Apply box cox transformation to ts_positive
	lambda = BoxCox.lambda(ts_positive, method = "loglik")
	ts_bc = BoxCox(ts_positive, lambda = lambda)
	list[ts_bc] <- ts_bc


	}
}


# stationarise each ts
differencing_order = 0
for ts_bc_index in list
{
		ts_bc <- list[ts_postive_index]
		stationary <- 0
		adf <- adf.test(ts_positive)

		if adf$p.value < 0.05 {
			differencing_order <- 0
			} 
			else 
			{  
			while adf$p.value > 0.05 
				{
					diffferentcing_order = differencing_order + 1
					ts <- diff(ts, differences = differencing_order)
					adf <- adf.test(ts)
					}
	stationary_ts <- diff(ts, differences = differencing_order)
}




library(TSA)
library(car)
library(dynlm)
library(Hmisc)
library(forecast)
library(xts)

price = read.csv("~/Documents/MATH1307_Forecasting/Tasks/Task 4/fuelPriceData.csv")
price = ts(price[,2], start=c(1998,4),frequency = 12)

plot(price,ylab='Fuel price',xlab='Year',main = "Time series plot of the monthly retail unleaded fuel prices series.")
points(y=price,x=time(price), pch=as.vector(season(price)))


fit1.ses = ses(price, initial="simple", h=5) 
fit2.holt = holt(price, initial="simple", h=5) # Let the software estimate both alpha and beta
fit3.holt = holt(price, initial="simple", exponential=TRUE, h=5) # Fit with exponential trend
fit4.holt = holt(price, damped=TRUE, initial="simple", h=5) # Fit with additive damped trend

fit5.hw = hw(price,seasonal="additive", h=5*frequency(price))
fit1.sea = hw(seaLevel,seasonal="additive", h=5*frequency(seaLevel))

fit6.hw = hw(price,seasonal="additive",damped = TRUE, h=5*frequency(price))
fit2.sea = hw(seaLevel,seasonal="additive", damped = TRUE, h=5*frequency(seaLevel))

fit7.hw = hw(price,seasonal="multiplicative", h=5*frequency(price))
fit3.sea = hw((seaLevel+50),seasonal="multiplicative", h=5*frequency(seaLevel))

fit8.hw = hw(price,seasonal="multiplicative",exponential = TRUE, h=5*frequency(price))
fit4.sea = hw((seaLevel+50),seasonal="multiplicative",damped = TRUE, h=5*frequency(seaLevel))

fit5.sea = hw((seaLevel+50),seasonal="multiplicative",damped = FALSE, exponential = TRUE, h=5*frequency(seaLevel))

fit3.etsA = ets(price, model="AAA")
fit1.sea.ets = ets(seaLevel, model = "AAA")

fit2.sea.ets = ets(log(seaLevel+50), model = "AAA", damped = TRUE)

fit1.etsA = ets(price, model="ANN")

fit3.etsM = ets(price, model="MAA")

fit3.sea.ets = ets((seaLevel+50), model = "MAA")

fit4.sea.ets = ets((seaLevel+50), model = "MAA", damped = TRUE)

fit1.etsM = ets(price, model="MNN")

fit2.etsA = ets(price, model="AAN")

fit2.etsM = ets(price, model="MAN", damped = TRUE)

fit4.etsM = ets(price, model="MAM")

fit5 = ets(price)



fit5.sea.ets = ets((seaLevel+50), model = "MMM")
fit6.sea.ets = ets((seaLevel+50), model = "MMM", damped = TRUE)
fit.auto = ets((seaLevel+50))

