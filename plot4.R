## Read the data into a table
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows=73440)

## Convert date & time variables into single variable

data$DateTime <- paste(data$Date, data$Time)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S")

# Create a smaller subset of the dates that we want
subset <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Setup the graphics device
png(file = "plot4.png", width = 480, height = 480)

## Generate the plots
par(mfrow = c(2, 2))

##Plot 1,1
with(subset, plot(x = DateTime, y = Global_active_power, xlab = "", ylab = "Global Active Power", main = NULL, col = "black", type = "l"))

#Plot 1,2
with(subset, plot(x = DateTime, y = Voltage, xlab = "datetime", ylab = "Voltage", main = NULL, col = "black", type = "l"))

#Plot 2,1
with(subset, plot(x = DateTime, y = Sub_metering_1, xlab = "", ylab = "Energy sub metering", main = NULL, col = "black", type = "l"))
with(subset, lines(x = DateTime, y = Sub_metering_2, col = "red"))
with(subset, lines(x = DateTime, y = Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

#Plot 2,2
with(subset, plot(x = DateTime, y = Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", main = NULL, col = "black", type = "l"))
dev.off()