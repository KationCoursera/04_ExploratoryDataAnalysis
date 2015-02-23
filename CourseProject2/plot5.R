library(plyr)
library(ggplot2)

NEI <- readRDS("expdata_prj2/summarySCC_PM25.rds")
SCC <- readRDS("expdata_prj2/Source_Classification_Code.rds")

vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
SCC.vehicles <- SCC[vehicles,]$SCC
NEI.vehicles <- NEI[NEI$SCC %in% SCC.vehicles,]

NEI.vehicles.baltimore <- NEI.vehicles[NEI.vehicles$fips==24510,]

png(filename = "plot5.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white",type="cairo")
ggplot(NEI.vehicles.baltimore,aes(factor(year),Emissions)) +
    geom_bar(stat="identity",fill="grey",width=0.75) +
    guides(fill=FALSE) +
    labs(x="Year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
    labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))
dev.off()