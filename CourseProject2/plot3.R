library(ggplot2)
library(plyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI.baltimore <- NEI[which(NEI$fips == "24510"), ]

NEI.baltimore.type <- ddply(NEI.baltimore, .(type, year), summarize, Emissions = sum(Emissions))

png(filename = "plot3.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white",type="cairo")
qplot(year, Emissions, data = NEI.baltimore.type, group = type, color = type, geom = c("point", "line"), ylab = expression("Total Emissions, PM"[2.5]), xlab = "Year", main = "Total Emissions in U.S. by Type of Pollutant")
dev.off()