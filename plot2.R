## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds") #we don't need this data for this specific plot

#aggregate the totals for Baltimore so that we can use this for a bar chart
baltimoreNEI <- NEI[NEI$fips=="24510",]
aggregateTotalsBaltimore <- aggregate(Emissions ~ year, baltimoreNEI ,sum)

#create the PNG device for the plot
png(filename='plot2.png', width=600, height=600)

#create the plot inside the PNG device
barplot(
  aggregateTotalsBaltimore$Emissions,
  names.arg=aggregateTotalsBaltimore$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Tons)",
  main="Total PM2.5 Emissions From All Baltimore City Sources"
)

#close the device to free up memory
dev.off()