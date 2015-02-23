library(plyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI.total <- tapply(NEI$Emissions, NEI$year, sum)

png(filename = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white",type="cairo")
plot(names(NEI.total), NEI.total, type="l", xlab = "Year", ylab = expression("Total" ~ PM[2.5] ~"Emissions (tons)"), main = expression("Total US" ~ PM[2.5] ~ "Emissions by Year"), col="Purple")
dev.off()