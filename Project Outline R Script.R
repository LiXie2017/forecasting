#### TEAM PROJECT

# Looping
# 1 read one line
# 2 name it
# 3 Transpose it
# 4 Check NA
# 5 Check year start and finish
# 6 Convert it to a ts object
# 7 Check Stationary test
# 8 If non-Stationary take first seasonality. 
# 9 Check Seasonality
# 10 Check negative and if so add the minimum plus 0.1
# 11 Split data between training and validation
# 12 Fit all models - exponential smoothing and ETS
# 13 For Each model capture MASE
# 14 Sort Score all the MASE
# 15 Check Residuals (test)  Normality and serial correlation (bgtest)
# 16 Number of non-normal standard residuals remain in the model.
# 17 Score the models - residuals

######
#12 Fit Models

#######
# define h=nf

fit1.ses = ses(price, initial="simple", h=5) 
fit2.ses = ses(price, initial="simple", exponential=TRUE, h=5) 
fit3.ses = ses(price, initial="simple", damped=TRUE, h=5) 
fit4.ses = ses(price, initial="simple", damped=TRUE, exponential=TRUE, h=5)
fit5.ses = ses(price, initial="optimal", h=5) 
fit6.ses = ses(price, initial="optimal", damped=TRUE, h=5) 
fit7.ses = ses(price, initial="optimal", exponential=TRUE, h=5)
fit8.ses = ses(price, initial="optimal", damped=TRUE, exponential=TRUE, h=5)

fit9.holt = holt(price, initial="simple", h=5)
fit10.holt = holt(price, initial="optimal", h=5) 
fit11.holt = holt(price, initial="optimal", damped=TRUE, h=5)
fit12.holt = holt(price, initial="simple", exponential=TRUE, h=5)
fit13.holt = holt(price, initial="optimal", exponential=TRUE, h=5)
fit14.holt = holt(price, initial="optimal", exponential=TRUE, damped=TRUE, h=5)

fit15.hw = hw(price,seasonal="additive", h=5*frequency(price))
fit16.hw = hw(price,seasonal="additive",damped = TRUE, h=5*frequency(price))

fit17.hw = hw(price,seasonal="multiplicative", h=5*frequency(price))
fit18.hw = hw(price,seasonal="multiplicative",damped = TRUE, h=5*frequency(price))
fit19.hw = hw(price,seasonal="multiplicative",exponential = TRUE, h=5*frequency(price))
fit20.hw = hw(price,seasonal="multiplicative",exponential = TRUE, damped=TRUE, h=5*frequency(price))


##########
#ETS Models

fit1.ets = ets(price, model="ANN")
fit2.ets = ets(price, model="AAN")
fit3.ets = ets(price, model="AAN", damped = TRUE)
fit4.ets = ets(price, model="AAA")
fit5.ets = ets(price, model="AAA", damped = TRUE)
fit6.ets = ets(price, model="ANA")
fit7.ets = ets(price, model="MNN")
fit8.ets = ets(price, model="MMN")
fit9.ets = ets(price, model="MMN", damped = TRUE)
fit10.ets = ets(price, model="MMM")
fit11.ets = ets(price, model="MMM", damped = TRUE)
fit12.ets = ets(price, model="MAA")
fit13.ets = ets(price, model="MAA", damped = TRUE)
fit14.ets = ets(price, model="MAN")
fit15.ets = ets(price, model="MAM")
fit16 = ets(price)

#fit1.ets = ets(price, model="ANN", damped = TRUE)
#fit5.ets = ets(price, model="MNN", damped = TRUE)
#fit9.ets = ets(price, model="MMA")*
#fit13.ets = ets(price, model="NNA")
#fit14.ets = ets(price, model="NMA")
#fit12.ets = ets(price, model="ANA", damped = TRUE)
#fit10.ets = ets(price, model="AMA")
#fit11.ets = ets(price, model="AAM")
#fit15.ets = ets(price, model="AMN")







