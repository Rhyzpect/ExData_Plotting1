# Download the File From UCI Website and save it to your directory
# This script uses dplyr package, please make sure you have it in your library
#
powconsumption <- subset(read.csv("~/R/Exploratory Analysis/household_power_consumption.txt",
                                   sep=";",na.strings = "?",stringsAsFactors = FALSE),Date=="1/2/2007"|Date=="2/2/2007")
summary(powconsumption)
str(powconsumption)
powconsumption$Date <- as.Date(powconsumption$Date,"%d/%m/%Y")
powconsumption$DateTime <- paste(powconsumption$Date,powconsumption$Time,sep=" ")
powconsumption$DateTime <- strptime(powconsumption$DateTime,"%Y-%m-%d %H:%M:%S")
library(dplyr)
powconsumption3 <- select(powconsumption,c(DateTime,Global_active_power:Sub_metering_3))
png(file="plot1.png",bg="transparent")
hist(powconsumption3$Global_active_power,col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()
