# plot3.R
# Composite line plots of sub metering

plot3 <- function() {
	# Read the data
	hpc <- read.csv("household_power_consumption.txt", stringsAsFactors=FALSE, na.strings=c('?'), sep=";")

	# Filter by the required times
	d1 <- hpc[as.Date('2007-02-01') <= as.Date(hpc$Date, "%d/%m/%Y") & as.Date(hpc$Date, "%d/%m/%Y") <= as.Date('2007-02-02'), ]

	# Convert Date & Time to timestamp values
	t <- strptime(paste(d1$Date, d1$Time), "%d/%m/%Y %H:%M:%S")

	# Setup single plot particularly if composite plots have been done
	par(mfrow=c(1,1))

	plot(t, d1$Sub_metering_1, type="n", main='', xlab='', ylab='Energy Sub Metering')
	lines(t, d1$Sub_metering_1)
	lines(t, d1$Sub_metering_2, col="red")
	lines(t, d1$Sub_metering_3, col="blue")
	legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5,2.5,2.5), col=c("black", "red", "blue"), cex=0.5)

	# Write the png file
	dev.copy(png, file = "plot3.png")
	dev.off()
}
