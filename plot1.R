# plot1.R
# Histogram of global active power

plot1 <- function() {
	# Read the data
	hpc <- read.csv("household_power_consumption.txt", stringsAsFactors=FALSE, na.strings=c('?'), sep=";")

	# Filter by the required times
	d1 <- hpc[as.Date('2007-02-01') <= as.Date(hpc$Date, "%d/%m/%Y") & as.Date(hpc$Date, "%d/%m/%Y") <= as.Date('2007-02-02'), ]

	# Setup single plot particularly if composite plots have been done
	par(mfrow=c(1,1))

	hist(d1$Global_active_power, col='red', main='Global Active Power', xlab='Global Active Power (kilowatts)')

	# Write the png file
	dev.copy(png, file = "plot1.png")
	dev.off()
}
