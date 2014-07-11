# plot2.R
# Line plot of global active power

plot2 <- function() {
	# Read the data
	hpc <- read.csv("household_power_consumption.txt", stringsAsFactors=FALSE, na.strings=c('?'), sep=";")

	# Filter by the required times
	d1 <- hpc[as.Date('2007-02-01') <= as.Date(hpc$Date, "%d/%m/%Y") & as.Date(hpc$Date, "%d/%m/%Y") <= as.Date('2007-02-02'), ]

	# Convert Date & Time to timestamp values
	t <- strptime(paste(d1$Date, d1$Time), "%d/%m/%Y %H:%M:%S")

	# Setup single plot particularly if composite plots have been done
	par(mfrow=c(1,1))

	plot(t, d1$Global_active_power, type="n", main='', xlab='', ylab='Global Active Power (kilowatts)')
	lines(t, d1$Global_active_power)

	# Write the png file
	dev.copy(png, file = "plot2.png")
	dev.off()
}
