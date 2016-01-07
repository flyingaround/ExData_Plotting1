# read data, include header, and treat '?' as NA
power <- read.table("household_power_consumption.txt", 
                    na.strings = c("?", NULL), sep = ";", header = TRUE)

# subset data with desirable dates
power = power[power$Date %in% c("1/2/2007", "2/2/2007"), ]

# convert to appropriate date format
datetime <- strptime(paste(power$Date, power$Time, sep = " "), "%d/%m/%Y %H:%M:%S")


# create plot
png(filename = "plot3.png", width = 480, height = 480, units = "px")
par(bg = "white")
plot(datetime, power$Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, power$Sub_metering_2, col = "red")
lines(datetime, power$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
dev.off()