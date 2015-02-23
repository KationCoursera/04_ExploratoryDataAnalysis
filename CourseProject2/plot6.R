library(plyr)
library(ggplot2)

NEI <- readRDS("expdata_prj2/summarySCC_PM25.rds")
SCC <- readRDS("expdata_prj2/Source_Classification_Code.rds")

vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
SCC.vehicles <- SCC[vehicles,]$SCC
NEI.vehicles <- NEI[NEI$SCC %in% SCC.vehicles,]

NEI.vehicles.baltimore <- NEI.vehicles[NEI.vehicles$fips=="24510",]
NEI.vehicles.baltimore$city <- "Baltimore City"

NEI.vehicles.losangeles <- NEI.vehicles[NEI.vehicles$fips=="06037",]
NEI.vehicles.losangeles$city <- "Los Angeles"

bothNEI <- rbind(NEI.vehicles.baltimore,NEI.vehicles.losangeles)

png(filename = "plot6.png", width = 580, height = 480, units = "px", pointsize = 12, bg = "white",type="cairo")
ggplot(bothNEI, aes(x=factor(year), y=Emissions, fill=city)) +
    geom_bar(aes(fill=year),stat="identity") +
    facet_grid(scales="free", space="free", .~city) +
    guides(fill=FALSE) +
    labs(x="Year", y=expression("Total PM"[2.5]*" Emission")) + 
    labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore and Los Angeles from 1999-2008"))
dev.off()