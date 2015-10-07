powconsumption <- subset(read.csv("~/R/Exploratory Analysis/household_power_consumption.txt",
                                   sep=";",na.strings = "?",stringsAsFactors = FALSE),Date=="1/2/2007"|Date=="2/2/2007")
summary(powconsumption)
str(powconsumption)
powconsumption$Date <- as.Date(powconsumption$Date,"%d/%m/%Y")
powconsumption$DateTime <- paste(powconsumption$Date,powconsumption$Time,sep=" ")
powconsumption$DateTime <- strptime(powconsumption$DateTime,"%Y-%m-%d %H:%M:%S")
library(dplyr)
powconsumption3 <- select(powconsumption,c(DateTime,Global_active_power:Sub_metering_3))

