## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds") #we don't need this data for this specific plot

#subset the data for Baltimore only using the fips code
baltimoreNEI <- NEI[NEI$fips=="24510",]

#aggregate the totals for Baltimore so that we can use this for a bar chart
aggregateTotalsBaltimore <- aggregate(Emissions ~ year, baltimoreNEI ,sum)

#create the PNG device for the plot
png(filename='plot3.png', width=600, height=600)

#create the plot inside the PNG device using ggplot2
library(ggplot2)

ggp <- ggplot(baltimoreNEI,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) +
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

print(ggp)

#close the device to free up memory
dev.off()