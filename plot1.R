library(dplyr)

SCC <- readRDS(file = "Source_Classification_Code.rds")
NEI <- readRDS(file = "summarySCC_PM25.rds")

#NEI$year<- factor(NEI$year) 

# data <- split(NEI, NEI$year);
# 
# total <- c(1:length(data))
# 
# for(i in 1:length(data)){
#   total[i] <- sum(data[[i]]$Emissions)
# }
# 
# plot(levels(NEI$year), log(total), type="l")

data <- group_by(NEI, year)
data <- summarise(data, Emissions = sum(Emissions))
plot(data$year, data$Emissions, type ="l", main="Total emissions", ylab = "Emissions", xlab ="Year")

dev.copy(png, file ="plot1.png")
dev.off()
