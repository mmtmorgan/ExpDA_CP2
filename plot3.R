setwd("/Users/mm57647/Desktop/Coursera_test/4-Exploratory_Data_Analysis/Week3")

######################################
##Plot3

#par(mfrow=c(1,1))

####################
##Read Data

NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

BaltimoreMD_NEI <- NEI[NEI$fips=="24510", ]

####################
##Make plots

library(ggplot2)

png("plot3.png", width=480, height=480)

base_ggplot <- ggplot(BaltimoreMD_NEI, aes(factor(year), Emissions))

complete_plot <- base_ggplot + 
  geom_bar(stat="identity") +
  facet_grid(. ~ type) +
  labs(x="year") +
  labs(y="PM2.5 Emissions for Baltimore, MD (Tons)") +
  labs(title="PM2.5 Emissions for Baltimore, MD by Source Type")

print(complete_plot)

dev.off()
