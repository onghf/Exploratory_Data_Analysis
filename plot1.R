# read data
power <-read.table("household_power_consumption.txt",header=TRUE, sep=";",na.strings="?",colClasses=c(rep('character',2),rep('numeric',7)))
power <- power[power$Date=='1/2/2007' | power$Date=='2/2/2007',]

#plot histogram
png(filename = "plot1.png", width = 480, height = 480)
hist(power$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

#turn off graphic device
dev.off()