library('plyr')
library('ggplot2')

# read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset data
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]
bmvNEI <- subset(vehiclesNEI, fips == "24510")


png('plot5.png')

ggp <- ggplot(bmvNEI,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  ylab('Emissions') +
  xlab('Year')

print(ggp)
dev.off()
