## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds") #we don't need this data for this specific plot

#aggregate the totals so that we can use this for a bar chart
aggregatedTotals <- aggregate(Emissions ~ year, NEI, sum)

#create the PNG device for the plot
png(filename='plot1.png', width=600, height=600)

#create the plot inside the PNG device
barplot(
  (aggregatedTotals$Emissions)/10^6,
  names.arg=aggregatedTotals$year,
  xlab="Year",
  ylab="PM2.5 Emissions (10^6 Tons)",
  main="Total PM2.5 Emissions From All US Sources"
)

#close the device to free up memory
dev.off()