plot3 <- function(file = "household_power_consumption_02_2007.txt") {
        require(dplyr)
	dt <- read.table("household_power_consumption_02_2007.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)
        date_time <- paste(dt$Date, dt$Time)
	date_time <- strptime(date_time, format="%d/%m/%Y %H:%M:%S")
	dt$date_time <- date_time
        png(filename="plot3.png")
	plot(dt$date_time, dt$Sub_metering_1, "l", xlab = "", ylab = "Energy sub metering")
	par(col="red")
        lines(dt$date_time, dt$Sub_metering_2, "l")
	par(col="blue")
	lines(dt$date_time, dt$Sub_metering_3, "l")
        par(col="black")
	legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c('black', 'red', 'blue'), lty=1)
	dev.off()
}

