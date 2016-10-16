library(lubridate)
library(dplyr)

fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile = "Household.zip") ## download the file from the url
unzip("Household.zip", exdir = ".") ## Unzip it
setwd("Household") ## set working directory
table <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?" )
table$Date <- dmy(table$Date)
table$Time <- hms(table$Time)
Data1 <- filter(table, Date =="2007-02-01" | Date =="2007-02-02")
plot(Data1$Sub_metering_1, xaxt = 'n', type = 'l', xlab = "",ylab = "Energy sub metering")
lines(Data1$Sub_metering_2, col = "red")
lines(Data1$Sub_metering_3, col = "blue")
axis(1, at=c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))
legend("topright", pch="-", lwd =3, cex = 0.50, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
