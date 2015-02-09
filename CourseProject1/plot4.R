# Required packages

library(lubridate)

# Download file 

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"powerConsumption.zip")

# Unzip the data set

unzip("powerConsumption.zip")

# Read the dataset to a data variable

data <- read.csv("household_power_consumption.txt", sep = ";",stringsAsFactor = FALSE)

# Extract only 2-day period on Feburary, 2007

data$Date <- dmy(data$Date)

data_feb <- data[data$Date >= ymd("2007-02-01") & data$Date <= ymd("2007-02-02"),]

# Combine date and time columns and delete time column

data_feb$Date <- data_feb$Date + hms(data_feb$Time)
data_feb <- data_feb[,-c(2)]

# Open graphic device and set number of plots per row, column

png(filename = "plot4.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white",type="cairo")

par(mfcol = c(2,2))

# Plot first plot (same as Plot 2)

plot(data_feb$Date,data_feb$Global_active_power,type="n",ylab="Global Active Power",xlab="")
lines(data_feb$Date,data_feb$Global_active_power)

# Plot second plot (same as Plot 3)

plot(data_feb$Date,data_feb$Sub_metering_1,ylab="Energy sub metering",xlab="",type="n",yaxt="n",ylim=c(0,40))
points(data_feb$Date,data_feb$Submetering_2)
points(data_feb$Date,data_feb$Submetering_3)
lines(data_feb$Date,data_feb$Sub_metering_1,col="black")
lines(data_feb$Date,data_feb$Sub_metering_2,col="red")
lines(data_feb$Date,data_feb$Sub_metering_3,col="blue")
axis(2,at=c(0,10,20,30),labels=c(0,10,20,30))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,bty="n",col=c("black","red","blue"))

# Plot third plot (Voltage)

plot(data_feb$Date,data_feb$Voltage,type="n",ylab="Voltage",xlab="datetime")
lines(data_feb$Date,data_feb$Voltage)

# Plot fourth plot (Global_reactive_power)

plot(data_feb$Date,data_feb$Global_reactive_power,type="n",ylab="Global_reactive_power",xlab="datetime")
lines(data_feb$Date,data_feb$Global_reactive_power)

dev.off()