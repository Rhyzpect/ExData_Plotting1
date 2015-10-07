# Download the File From UCI Website and save it to your directory
# Unzip it and extract the .txt data to your directory and don't rename the file
# This script uses dplyr package, please make sure you have it in your library

directory <- getwd() 

# Reading the data from the directory: Since only dates 1/2/2007 and 2/2/2007
# are considered, subset() function is used. It has two arguments the read.csv()
# and the date conditions. The read.csv() function has four arguments. Since the
# separator in our data is ";" and NA's are represented as "?", then sep =";" 
# and na.strings = "?". Store this to variable powconsumption.

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

# We will save the data in png format. Use png() function. The default width &
# height is already 480 pixels so we don't need to specify it. 

png(file="plot1.png",bg="transparent")

# To make a histogram of the Global Active power, use hist() function. Set the
# required label. 

hist(powconsumption3$Global_active_power,col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)",border=1,font.lab=2)

dev.off()

message("Your Graph is Save in Your Working Directory")
