# plot4.R
# 4-plot display

plot4 <- function() {
	# Read the data
	hpc <- read.csv("household_power_consumption.txt", stringsAsFactors=FALSE, na.strings=c('?'), sep=";")

	# Filter by the required times
	d1 <- hpc[as.Date('2007-02-01') <= as.Date(hpc$Date, "%d/%m/%Y") & as.Date(hpc$Date, "%d/%m/%Y") <= as.Date('2007-02-02'), ]

	# Convert Date & Time to timestamp values
	t <- strptime(paste(d1$Date, d1$Time), "%d/%m/%Y %H:%M:%S")

	# Setup the plot as 2 columns and 2 rows; load columnwise
	par(mfcol=c(2,2), mar = c(4, 4, 2, 1))

	# Global active power v time plot
	plot(t, d1$Global_active_power, type="n", main='', xlab='', ylab='Global Active Power (kilowatts)')
	lines(t, d1$Global_active_power)

	# Sub metering plot
	plot(t, d1$Sub_metering_1, type="n", main='', xlab='', ylab='Energy Sub Metering')
	lines(t, d1$Sub_metering_1)
	lines(t, d1$Sub_metering_2, col="red")
	lines(t, d1$Sub_metering_3, col="blue")
	legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(1,1,1), col=c("black", "red", "blue"), cex=0.5)

	# Voltage
	plot(t, d1$Voltage, type="n", main='', xlab='datetime', ylab='Voltage')
	lines(t, d1$Voltage)

	# Global reactive power
	plot(t, d1$Global_reactive_power, type="n", main='', xlab='datetime', ylab='Global Reactive Power')
	lines(t, d1$Global_reactive_power)

	# Write the png file
	dev.copy(png, file = "plot4.png")
	dev.off()
}
