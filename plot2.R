library('plyr')

# read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset only Baltimor, MD data
bmNEI <- subset(NEI, fips == "24510")
emissions <- ddply(bmNEI, ~year, summarise, sum=sum(Emissions))

png('plot2.png')
barplot(emissions$sum, names.arg=emissions$year, xlab="Year", ylab="Emissions in Tons")
dev.off()
