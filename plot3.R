library(dplyr)
library(ggplot2)

SCC <- readRDS(file = "Source_Classification_Code.rds")
NEI <- readRDS(file = "summarySCC_PM25.rds")

data <- NEI[NEI$fips =="24510",]

data <- group_by(data, year, type)
data <- summarise(data, Emissions = sum(Emissions))
qplot(year, Emissions,colour = type, geom=c("point", "line"),data=data, main = "Emissions in Baltimore City")

dev.copy(png, file ="plot3.png")
dev.off()
