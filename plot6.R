setwd("/Users/mm57647/Desktop/Coursera_test/4-Exploratory_Data_Analysis/Week3")

######################################
##Plot6

#par(mfrow=c(1,1))

####################
##Read Data

NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

BaltimoreMD_LACA_onroad_NEI <- subset(NEI, (fips=="24510" | fips=="06037") & type=="ON-ROAD")
BaltimoreMD_LACA_onroad_NEI$city[BaltimoreMD_LACA_onroad_NEI$fips=="24510"] <- "Baltimore, MD"
BaltimoreMD_LACA_onroad_NEI$city[BaltimoreMD_LACA_onroad_NEI$fips=="06037"] <- "Los Angeles, CA"

####################
##Make plots

library(ggplot2)

png("plot6.png", width=480, height=480)

base_ggplot <- ggplot(BaltimoreMD_LACA_onroad_NEI, aes(factor(year), Emissions))

complete_plot <- base_ggplot + 
  geom_bar(stat="identity") +
  facet_grid(. ~ city) +
  labs(x="year") +
  labs(y="PM2.5 Emissions (Tons)") +
  labs(title="PM2.5 On-Road Emissions for Baltimore, MD and Los Angeles, CA")

print(complete_plot)

dev.off()
