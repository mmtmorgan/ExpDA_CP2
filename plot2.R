setwd("/Users/mm57647/Desktop/Coursera_test/4-Exploratory_Data_Analysis/Week3")

######################################
##Plot2

#par(mfrow=c(1,1))

####################
##Read Data

NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

yearly_emission_totals_baltimoreMD <- aggregate(Emissions ~ year, NEI[NEI$fips=="24510", ], sum)

####################
##Make a BarPlot

png("plot2.png", width=480, height=480)

barplot(yearly_emission_totals_baltimoreMD$Emissions, names.arg=yearly_emission_totals_baltimoreMD$year, xlab = "Year", ylab = "PM2.5 Emissions for Baltimore, MD (Tons)")

dev.off()
