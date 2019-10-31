library(dplyr)
library(ggplot2)

SCC <- readRDS(file = "Source_Classification_Code.rds")
NEI <- readRDS(file = "summarySCC_PM25.rds")

src <- as.character(SCC$SCC[which(grepl("[Mm]otor|[Vv]ehicle", SCC$Short.Name))])
data <- NEI[NEI$SCC %in% src & (NEI$fips=="24510" | NEI$fips=="06037"),]
data <- group_by(data, year, fips)
data <- summarise(data, Emissions = sum(Emissions))
data$fips <-factor(data$fips, levels = c("24510","06037"), labels = c("Baltimore City","Los Angeles County"))

qplot(year, Emissions, geom=c("point", "line"),data=data, colour=fips, main ="Emissions from motor vehicle sources")
dev.copy(png, file ="plot6.png")
dev.off()

