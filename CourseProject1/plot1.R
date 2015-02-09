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

# Draw the histogram

png(filename = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white",type="cairo")
hist(as.numeric(as.character(data_feb$Global_active_power)), col = "red", breaks = 12, main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()