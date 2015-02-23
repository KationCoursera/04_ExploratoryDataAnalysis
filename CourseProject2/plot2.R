library(plyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI.baltimore <- NEI[which(NEI$fips == "24510"), ]
NEI.baltimore.aggregated <- with(NEI.baltimore, aggregate(Emissions, by = list(year), sum))
colnames(NEI.baltimore.aggregated) <- c("Year", "Emissions")

png(filename = "plot2.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white",type="cairo")
plot(NEI.baltimore.aggregated, type = "l",col="red", ylab = expression("Total" ~ PM[2.5] ~"Emissions (tons)"), xlab = "Year", main = expression("Total for Baltimore City" ~ PM[2.5] ~ "Emissions by Year"), xlim = c(1999,2008))
dev.off()