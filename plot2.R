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
png(filename = "plot2.png", width = 480, height = 480)
plot(power$DateTime, power$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#turn off graphic device
dev.off()