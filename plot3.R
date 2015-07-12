data <-  read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=F)

data$FullDate <- paste(data$Time, data$Date)
data$FullDate <- strptime(data$FullDate, "%H:%M:%S %d/%m/%Y")

data$Date <- strptime(data$Date, "%d/%m/%Y")
startDate <- strptime("01/02/2007", "%d/%m/%Y")
stopDate <- strptime("02/02/2007", "%d/%m/%Y")


data <- data[data$Date>=startDate & data$Date<=stopDate,]

png("plot3.png")
with(data, plot(FullDate, Sub_metering_1, type='l',
                ylab="Energy sub metering",
                xlab=""))
with(data, lines(FullDate, Sub_metering_2, col="red"))
with(data, lines(FullDate, Sub_metering_3, col="blue"))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lwd=1, col=c("black", "red", "blue"))

dev.off()
