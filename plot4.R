setwd("/Users/mm57647/Desktop/Coursera_test/4-Exploratory_Data_Analysis/Week3")

######################################
##Plot4

#par(mfrow=c(1,1))

####################
##Read Data

NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

#unique(SCC$EI.Sector)
Coal_Combustion_SCC <- subset(SCC, EI.Sector=="Fuel Comb - Electric Generation - Coal" | EI.Sector=="Fuel Comb - Industrial Boilers, ICEs - Coal" | EI.Sector=="Fuel Comb - Comm/Institutional - Coal")
Coal_Combustion_SCC_codes <- Coal_Combustion_SCC$SCC

Coal_Combustion_NEI <- NEI[NEI$SCC %in% Coal_Combustion_SCC_codes, ]

####################
##Make plots

library(ggplot2)

png("plot4.png", width=480, height=480)

base_ggplot <- ggplot(Coal_Combustion_NEI, aes(factor(year), Emissions/1000))

complete_plot <- base_ggplot + 
  geom_bar(stat="identity") +
  labs(x="year") +
  labs(y="PM2.5 Emissions (Thousands of Tons)") +
  labs(title="PM2.5 Coal-Combustion Emissions for Entire U.S.")

print(complete_plot)

dev.off()
