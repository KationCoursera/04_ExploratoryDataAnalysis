# Required packages

library(lubridate)

# Download file 

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"powerConsumption.zip")

# Unzip the data set

unzip("powerConsumption.zip")

# Read the dataset to a data variable

data <- read.csv("household_power_consumption.txt", sep = ";")

# Extract only 2-day period on Feburary, 2007

data$Date <- dmy(data$Date)

data_feb <- data[data$Date >= ymd("2007-02-01") & data$Date <= ymd("2007-02-02"),]

# Draw the histogram

png(filename = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
hist(as.numeric(as.character(data_feb$Global_active_power)), col = "red", breaks = 12, main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()