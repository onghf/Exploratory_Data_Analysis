#read data
power <-read.table("household_power_consumption.txt",header=TRUE, sep=";",na.strings="?",colClasses=c(rep('character',2),rep('numeric',7)))
power <- power[power$Date=='1/2/2007' | power$Date=='2/2/2007',]

#merge data
dateTime <- as.POSIXct(paste(power$Date, power$Time, sep = ";"), format = "%d/%m/%Y;%H:%M:%S")
power$Date <- NULL
power$Time <- NULL
power <- cbind("DateTime" = dateTime, power)
remove(dateTime)

#plot graph
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(power$DateTime, power$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(power$DateTime, power$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(power$DateTime, power$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(power$DateTime, power$Sub_metering_2, type = "l", col = "red")
lines(power$DateTime, power$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"))
plot(power$DateTime, power$Global_reactive_power, type = "l", xlab  = "datetime", ylab = "Global_reactive_power", lwd = 0.5)

#turn off graphic device
dev.off()