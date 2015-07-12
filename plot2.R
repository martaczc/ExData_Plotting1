data <-  read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=F)

data$FullDate <- paste(data$Time, data$Date)
data$FullDate <- strptime(data$FullDate, "%H:%M:%S %d/%m/%Y")

data$Date <- strptime(data$Date, "%d/%m/%Y")
startDate <- strptime("01/02/2007", "%d/%m/%Y")
stopDate <- strptime("02/02/2007", "%d/%m/%Y")


data <- data[data$Date>=startDate & data$Date<=stopDate,]

png("plot2.png")
with(data, plot(FullDate, Global_active_power, type='l',
                ylab="Global Active Power (kilowatts)",
                xlab=""))
dev.off()
