library(dplyr)
library(ggplot2)

SCC <- readRDS(file = "Source_Classification_Code.rds")
NEI <- readRDS(file = "summarySCC_PM25.rds")

src <- as.character(SCC$SCC[which(grepl("Coal", SCC$Short.Name))])
data <- NEI[NEI$SCC %in% src,]
data <- group_by(data, year)
data <- summarise(data, Emissions = sum(Emissions))

qplot(year, Emissions, geom=c("point", "line"),data=data, main="Emissions from coal combustion-related sources in USA")
dev.copy(png, file ="plot4.png")
dev.off()
