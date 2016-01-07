# read data, include header, and treat '?' as NA
power <- read.table("household_power_consumption.txt", 
                    na.strings = c("?", NULL), sep = ";", header = TRUE)

# subset data with desirable dates
power = power[power$Date %in% c("1/2/2007", "2/2/2007"), ]

# create plot
png(filename = "plot1.png", width = 480, height = 480, units = "px")
par(bg = "white")
hist(as.numeric(power$Global_active_power), xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = 'red')
dev.off()