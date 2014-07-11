# plot1.R

# Read in data filtering for 1st and 2nd of Feb 2007 - will only work on a UNIX system
# This is to save memory
data <- read.csv(pipe("egrep \"^(Date|[12]/2/2007)\" household_power_consumption.txt"), sep=";", na.strings="?")

# Open a file to plot to
png("plot1.png")
# Draw a histogram to the graphics device
hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
# Finish the plot
dev.off()
