library('plyr')
library('ggplot2')

# read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset data
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

bmvNEI <- vehiclesNEI[vehiclesNEI$fips == '24510',]
bmvNEI$city <- "Baltimore"
lavNEI <- vehiclesNEI[vehiclesNEI$fips == '06037',]
lavNEI$city <- "Los Angeles"
bindNEI <- rbind(bmvNEI, lavNEI)

png('plot6.png')

ggp <- ggplot(bindNEI, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(scales="free", space="free", .~city) +
  theme_bw() +  guides(fill=FALSE) +
  ylab('Emissions') +
  xlab('Year')

print(ggp)
dev.off()
