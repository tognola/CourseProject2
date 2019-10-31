library(dplyr)
library(ggplot2)

SCC <- readRDS(file = "Source_Classification_Code.rds")
NEI <- readRDS(file = "summarySCC_PM25.rds")

src <- as.character(SCC$SCC[which(grepl("[Mm]otor|[Vv]ehicle", SCC$Short.Name))])
data <- NEI[NEI$SCC %in% src & NEI$fips=="24510",]
data <- group_by(data, year)
data <- summarise(data, Emissions = sum(Emissions))

qplot(year, Emissions, geom=c("point", "line"),data=data, main="Emissions from motor vehicle sources in Baltimore City")
dev.copy(png, file ="plot5.png")
dev.off()
