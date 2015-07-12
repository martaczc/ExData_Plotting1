data <-  read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=F)

data$datetime <- paste(data$Time, data$Date)
data$datetime <- strptime(data$datetime, "%H:%M:%S %d/%m/%Y")

data$Date <- strptime(data$Date, "%d/%m/%Y")
startDate <- strptime("01/02/2007", "%d/%m/%Y")
stopDate <- strptime("02/02/2007", "%d/%m/%Y")


data <- data[data$Date>=startDate & data$Date<=stopDate,]

png("plot4.png")

par(mfcol=c(2,2))

with(data, plot(datetime, Global_active_power, type='l',
                ylab="Global Active Power (kilowatts)",
                xlab=""))

with(data, plot(datetime, Sub_metering_1, type='l',
                ylab="Energy sub metering",
                xlab=""))
with(data, lines(datetime, Sub_metering_2, col="red"))
with(data, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lwd=1, col=c("black", "red", "blue"))



dev.off()
