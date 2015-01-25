library('plyr')

# read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

emissions <- ddply(NEI, ~year, summarise, sum=sum(Emissions))

png('plot1.png')
barplot(emissions$sum, names.arg=emissions$year, xlab="Year", ylab="Emissions in Tons")
dev.off()
