library('plyr')
library('ggplot2')

# read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset only Baltimor, MD data
bmNEI <- subset(NEI, fips == "24510")

png('plot3.png')

ggp <- ggplot(bmNEI, aes(factor(year), Emissions, fill = type)) +
  geom_bar(stat="identity") +
  theme_bw() +
  guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") +
  ylab('Emissions') +
  xlab('Year')

print(ggp)
dev.off()
