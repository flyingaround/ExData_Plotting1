# read data, include header, and treat '?' as NA
power <- read.table("household_power_consumption.txt", 
                    na.strings = c("?", NULL), sep = ";", header = TRUE)

# subset data with desirable dates
power = power[power$Date %in% c("1/2/2007", "2/2/2007"), ]

# convert to appropriate date format
datetime <- strptime(paste(power$Date, power$Time, sep = " "), "%d/%m/%Y %H:%M:%S")


# create plot
png(filename = "plot2.png", width = 480, height = 480, units = "px")
par(bg = "white")
plot(datetime, power$Global_active_power, "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()