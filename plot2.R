library(dplyr)

SCC <- readRDS(file = "Source_Classification_Code.rds")
NEI <- readRDS(file = "summarySCC_PM25.rds")


data <- NEI[NEI$fips =="24510",]
data <- group_by(data, year)
data <- summarise(data, Emissions = sum(Emissions))
plot(data$year, data$Emissions, type ="l",  main="Total emissions in Baltimore City", ylab = "Emissions", xlab ="Year")

dev.copy(png, file ="plot2.png")
dev.off()

# NEI$year<- factor(NEI$year)
# 
# data <- split(NEI, NEI$year);
# 
# total <- c(1:length(data))
# 
# for(i in 1:length(data)){
#   total[i] <- sum(data[[i]]$Emissions)
# }
# 
# plot(levels(NEI$year), total, type="l")
