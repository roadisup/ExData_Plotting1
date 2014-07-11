# plot4.R

# Read in data filtering for 1st and 2nd of Feb 2007 - will only work on a UNIX system
# Also combine date and time columns
# This is to save memory
data <- read.csv(pipe("egrep \"^(Date|[12]/2/2007)\" household_power_consumption.txt|sed -r 's/(2007|Date);/\\1 /'"), sep=";", na.strings="?")
# Format the date as a POSIXlt object
data$Date.Time <- as.POSIXlt(strptime(data$Date.Time, "%d/%m/%Y %H:%M:%S"))

# Open a file to plot to
png("plot4.png")

# We're doing a 2x2 plot matrix
par(mfcol=c(2,2))

# Global active power plot

# Set up everything but the data in the plot
plot(data$Date.Time, data$Global_active_power, type="n", xlab="", ylab="Global Active Power")
# Add the data as a line
lines(data$Date.Time, data$Global_active_power)

# Metering plot

# Set up everything but the data in the plot
plot(data$Date.Time, data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
# Draw the joined up data for Sub_metering_1 in black (default)
lines(data$Date.Time, data$Sub_metering_1)
# Draw the joined up data for Sub_metering_2 in red
lines(data$Date.Time, data$Sub_metering_2, col="red")
# Draw the joined up data for Sub_metering_3 in blue
lines(data$Date.Time, data$Sub_metering_3, col="blue")
# Add a legend in the top right
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"),lty=1)

# Voltage plot
plot(data$Date.Time, data$Voltage, type="n", xlab="datetime", ylab="Voltage")
lines(data$Date.Time, data$Voltage)

# Global reactive power plot
plot(data$Date.Time, data$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
lines(data$Date.Time, data$Global_reactive_power)

# And finish the plot
dev.off()
