setwd("/Users/mm57647/Desktop/Coursera_test/4-Exploratory_Data_Analysis/Week3")

######################################
##Plot1

#par(mfrow=c(1,1))

####################
##Read Data

NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

#head(NEI)

yearly_emission_totals <- aggregate(Emissions ~ year, NEI, sum)

####################
##Make a BarPlot

png("plot1.png", width=480, height=480)

barplot(yearly_emission_totals$Emissions/1000000, names.arg=yearly_emission_totals$year, xlab = "Year", ylab = "PM2.5 Emissions (Millions of Tons)")

dev.off()
