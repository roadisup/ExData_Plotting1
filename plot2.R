# plot2.R

# Read in data filtering for 1st and 2nd of Feb 2007 - will only work on a UNIX system
# Also combine date and time columns
# This is to save memory
data <- read.csv(pipe("egrep \"^(Date|[12]/2/2007)\" household_power_consumption.txt|sed -r 's/(2007|Date);/\\1 /'"), sep=";", na.strings="?")
# Format the date as a POSIXlt object
data$Date.Time <- as.POSIXlt(strptime(data$Date.Time, "%d/%m/%Y %H:%M:%S"))

# Open a file to plot to
png("plot2.png")
# Set up everything but the data in the plot
plot(data$Date.Time, data$Global_active_power, type="n", xlab="", ylab="Global Active Power")
# Add the data as a line
lines(data$Date.Time, data$Global_active_power)
# Finish the plot
dev.off()