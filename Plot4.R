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
  par(mfrow = c(2,2), ask=TRUE)
  ##Plot1
  plot(Data1$Global_active_power, type="l", xaxt = 'n',ylab = "Global Active Power", xlab = "")
  axis(1, at=c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))
  ##Plot2
  plot(Data1$Voltage, type="l", xaxt = 'n',ylab = "Global Active Power", xlab = "datetime")
  axis(1, at=c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))
  ##Plot3
  plot(Data1$Sub_metering_1, xaxt = 'n', type = 'l', xlab = "",ylab = "Energy sub metering")
  lines(Data1$Sub_metering_2, col = "red")
  lines(Data1$Sub_metering_3, col = "blue")
  axis(1, at=c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))
  legend("topright", pch="-", lwd =2, y.intersp =0.3,x.intersp =0.2, inset=-0.1,  cex =.7, bty = "n",  col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
  ## y.intersp reduces distance between the text, inset reduces empty white space, bty = "n" for no boundary line
  ##Plot4
  plot(Data1$Global_reactive_power, type="l", xaxt = 'n',ylab = "Global_reactive_power", xlab = "datetime")
  axis(1, at=c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))