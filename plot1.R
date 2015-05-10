## Read the data into a table
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows=73440)

## Convert date & time variables into single variable

data$DateTime <- paste(data$Date, data$Time)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S")

## Create a smaller subset of the dates that we want
subset <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

## Setup the graphics device
png(file = "plot1.png", width = 480, height = 480)

## Generate the plot
with(subset, hist(Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red"))
dev.off()