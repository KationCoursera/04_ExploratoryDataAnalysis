library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset coal combustion related NEI data

SSC.comb <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
SSC.coal <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
SSC.combined <- (SSC.comb & SSC.coal)
SSC.combustion <- SCC[SSC.combined,]$SCC
NEI.combustion <- NEI[NEI$SCC %in% SSC.combustion,]

png(filename = "plot4.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white",type="cairo")
ggplot(NEI.combustion,aes(factor(year),Emissions/10^3)) +
    geom_bar(stat="identity",fill="grey",width=0.75) +
    guides(fill=FALSE) +
    labs(x="Year", y=expression("Total PM"[2.5]*" Emission (kilo Tons)")) + 
    labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))
dev.off()