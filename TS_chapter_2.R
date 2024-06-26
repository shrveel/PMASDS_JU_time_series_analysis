
# Chapter 2 exercise solve:
#author: Shouirav Majumder, 20231046

library(fpp2)

1. Use the help menu to explore what the series gold, woolyrnq and gas represent. These are available in the forecast package.

# See the structures of datas
str(gold)
str(woolyrnq)
str(gas)

# a. Use autoplot to plot each of these in separate plots.
autoplot(gold)
autoplot(woolyrnq)
autoplot(gas)
writeLines("")

# b. What is the frequency of each commodity series? Hint: apply the frequency() function.
print("Frequency")
print("gold")
frequency(gold)
print("woolyrnq")
frequency(woolyrnq)
print("gas")
frequency(gas)
writeLines("")

# c. Use which.max() to spot the outlier in the gold series. Which observation was it?
print("When gold got maximum value?")
which.max(gold)
print("What was the gold's maximum value?")
gold[which.max(gold)

2. Download the file tute1.csv from OTexts.org/fpp2/extrafiles/tute1.csv, open it in Excel (or some other spreadsheet application), and review its contents. You should find four columns of information. Columns B through D each contain a quarterly series, labelled Sales, AdBudget and GDP. Sales contains the quarterly sales for a small company over the period 1981-2005. AdBudget is the advertising budget and GDP is the gross domestic product. All series have been adjusted for inflation.

# a. You can read the data into R with the following script:

tute1 <- read.csv("tute1.csv", header=TRUE)
View(tute1)

# b. Convert the data to time series

mytimeseries <- ts(tute1[,-1], start=1981, frequency=4)

# (The [,-1] removes the first column which contains the quarters as we don't need them now.)

# c. Construct time series plots of each of the three series

autoplot(mytimeseries, facets=TRUE)

# Check what happens when you don't include facets=TRUE.

autoplot(mytimeseries)

```


3. Download some monthly Australian retail data from OTexts.org/fpp2/extrafiles/retail.xlsx. These represent retail sales in various categories for different Australian states, and are stored in a MS-Excel file.

# a. You can read the data into R with the following script:

retaildata <- xlsx::read.xlsx("retail.xlsx", sheetIndex = 1, startRow = 2)
View(retaildata)
# retaildata <- readxl::read_excel("retail.xlsx", skip=1)

# You may need to first install the readxl package. The second argument (skip=1) is required because the Excel sheet has two header rows.

# b. Select one of the time series as follows (but replace the column name with your own chosen column):

myts <- ts(retaildata[,"A3349873A"], frequency=12, start=c(1982,4))

# c. Explore your chosen retail time series using the following functions: autoplot, ggseasonplot, ggsubseriesplot, gglagplot, ggAcf
#Can you spot any seasonality, cyclicity and trend? What do you learn about the series?

autoplot(myts)
ggseasonplot(myts)
ggsubseriesplot(myts)
gglagplot(myts, lags = 12)
ggAcf(myts)

# I can see seasonality and trend of the data


4. Create time plots of the following times series: bicoal, chicken, dole, usdeaths, lynx, goog, writing, fancy, a10, h02.

# - Use help() to find out about the data in each series.
help(bicoal)
help(chicken)
help(dole)
help(usdeaths)
help(lynx)
help(goog)
help(writing)
help(fancy)
help(a10)
help(h02)

# - For the goog plot, modify the axis labels and title.
autoplot(goog) +
  ggtitle("Daily closing stock prices of Google Inc.") +
  xlab("Time") +
  ylab("Price(Unit: US$)")


5. Use the ggseasonplot and ggsubseriesplot functions to explore the seasonal patterns in the following time series: writing, fancy, a10, h02.

# - What can you say about the seasonal patterns?
# - Can you identify any unusual years?

ggseasonplot(writing)
ggsubseriesplot(writing)
# The sales amount of paper falls down in August annually

ggseasonplot(fancy)
ggsubseriesplot(fancy)
# In December, 1992 the monthly sales for a souvenir shop increased dramatically compared to the same month of the last year

ggseasonplot(a10)
ggsubseriesplot(a10)
# The amount of antidiabetes monthly scripts falls down in February annually

ggseasonplot(h02)
ggsubseriesplot(h02)
# The amount of corticosteroid monthly scripts also falls down in February annually

```


6. Use the the following graphics functions: autoplot, ggseasonplot, ggsubseriesplot, gglagplot, ggAcf and explore features from the following time series: hsales, usdeaths, bricksq, sunspotarea, gasoline.

# - Can you spot any seasonality, cyclicity and trend?
# - What do you learn about the series?

autoplot(hsales)
ggseasonplot(hsales)
ggsubseriesplot(hsales)
gglagplot(hsales)
ggAcf(hsales, lag.max = 400)
# can spot seasonality and cyclicity. The cycle period is about 4 years(100 months)

autoplot(usdeaths)
ggseasonplot(usdeaths)
ggsubseriesplot(usdeaths)
gglagplot(usdeaths)
ggAcf(usdeaths, lag.max = 60)
# can spot seasonality

autoplot(bricksq)
ggseasonplot(bricksq)
ggsubseriesplot(bricksq)
gglagplot(bricksq)
ggAcf(bricksq, lag.max = 200)
# can spot little seasonality and strong trend

autoplot(sunspotarea)
# ggseasonplot(sunspotarea) 
# not seasonal, can't draw it
# ggsubseriesplot(sunspotarea)
# not seasonal, useless to draw it
gglagplot(sunspotarea)
ggAcf(sunspotarea, lag.max = 50)
# can spot strong cyclicity

autoplot(gasoline)
ggseasonplot(gasoline)
# ggsubseriesplot(gasoline)
# The number of weeks is 52 and it looked like it is too much for subseriesplot
gglagplot(gasoline)
ggAcf(gasoline, lag.max = 1000)
# can spot seasonality and trend

7. The arrivals data set comprises quarterly international arrivals (in thousands) to Australia from Japan, New Zealand, UK and the US.

# See the structure of arrivals
str(arrivals)

# - Use autoplot, ggseasonplot and ggsubseriesplot to compare the differences between the arrivals from these four countries.
# - Can you identify any unusual observations?
autoplot(arrivals)
# The biggest number of arrivals came from New Zealand in 1980s. And the title owner country changed to Japan in 1990s and came back to UK in 2000s.
# The arrival data of UK shows the biggest quarterly fluctuation.

ggseasonplot(arrivals[, "Japan"])
ggseasonplot(arrivals[, "NZ"])
ggseasonplot(arrivals[, "UK"])
ggseasonplot(arrivals[, "US"])

ggsubseriesplot(arrivals[, "Japan"])
ggsubseriesplot(arrivals[, "NZ"])
ggsubseriesplot(arrivals[, "UK"])
ggsubseriesplot(arrivals[, "US"])
# The arrivals from Japan decrease a lot in 2nd quarter compared to the other quarteres.
# The arrivals from New Zealand are highest in 3rd quarter and lowest in 1st quarter.
# The arrivals from UK and US are low in 2nd and 3rd quarters and high in 1st and 4th quarters.

```


9. The pigs data shows the monthly total number of pigs slaughtered in Victoria, Australia, from Jan 1980 to Aug 1995. 
Use mypigs <- window(pigs, start=1990) to select the data starting from 1990. 
Use autoplot and ggAcf for mypigs series and compare these to white noise plots from Figures 2.15 and 2.16.

mypigs <- window(pigs, start=1990)
str(mypigs)

autoplot(mypigs)
ggAcf(mypigs)
# can find that 3 autocorrelation values were outside of bounds. Therefore mypigs isn't probably white noise.

``` 

10. dj contains 292 consecutive trading days of the Dow Jones Index. Use ddj <- diff(dj) to compute the daily changes in the index. Plot ddj and its ACF. Do the changes in the Dow Jones Index look like white noise?

ddj <- diff(dj)
str(ddj)

autoplot(ddj)
ggAcf(ddj)
# can find that substantially less than 5% of autocorrelation values were outside of bounds. Therefore ddj can be white noise.
