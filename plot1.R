data <-  read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=F)

data$Date <- strptime(data$Date, "%d/%m/%Y")
startDate <- strptime("01/02/2007", "%d/%m/%Y")
stopDate <- strptime("02/02/2007", "%d/%m/%Y")

data <- data[data$Date>=startDate & data$Date<=stopDate,]

png("plot1.png")
with(data, hist(Global_active_power,col="red",
                main="Global Active Power",
                xlab="Global Active Power (kilowatts)"))
dev.off()

