# The first part of the script is the same as plot1.R script, i.e., reading the
# data and cleaning it. The only difference is when plotting occurs.
# Download the File From UCI Website and save it to your directory
# Unzip it and extract the .txt data to your directory and don't rename the file
# This script uses dplyr package, please make sure you have it in your library

directory <- getwd() 

# Reading the data from the directory: Since only dates 1/2/2007 and 2/2/2007
# are considered, subset() function is used. It has two arguments the read.csv()
# and the date conditions. The read.csv() function has four arguments. Since the
# separator in our data is ";" and NA's are represented as "?", then sep =";" 
# and na.strings = "?".Store this to variable powconsumption.

powconsumption <- subset(read.csv(paste(directory,"household_power_consumption.txt",sep="/"),
                                  sep=";",na.strings = "?",stringsAsFactors = FALSE),Date=="1/2/2007"|Date=="2/2/2007")

# Check the powconsumption data, using summary() and str()

summary(powconsumption)

str(powconsumption)

# Notice that the Date column is in character string. Convert that one as date
# using as.Date() function.

powconsumption$Date <- as.Date(powconsumption$Date,"%d/%m/%Y")

# Combine the Date and Time column and make a new column called DateTime column
# in the data. 

powconsumption$DateTime <- paste(powconsumption$Date,powconsumption$Time,sep=" ")

powconsumption$DateTime <- strptime(powconsumption$DateTime,"%Y-%m-%d %H:%M:%S")

# Using the dplyr package, we can rearrange and remove Date and Time column with
# select() function. Store this to a new variable powconsumption3.

library(dplyr)

powconsumption3 <- select(powconsumption,c(DateTime,Global_active_power:Sub_metering_3))

# To plot our desired plot and save it to a png format, use the following code

png(file="plot2.png",bg="transparent")

plot(powconsumption3$DateTime,powconsumption3$Global_active_power,type="l",
     xlab="",ylab="Global Active Power (kilowatts)",font.lab=2,lwd=1.5)

dev.off()

message("Your Graph is Save in Your Working Directory")