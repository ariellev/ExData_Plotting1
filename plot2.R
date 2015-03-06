plot2 <- function(file = "household_power_consumption_02_2007.txt") {
        require(dplyr)
	dt <- read.table("household_power_consumption_02_2007.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)
        date_time <- paste(dt$Date, dt$Time)
	date_time <- strptime(date_time, format="%d/%m/%Y %H:%M:%S")
	dt$date_time <- date_time
        png(filename="plot2.png")
	plot(dt$date_time, dt$Global_active_power, "l", xlab = "", ylab = "Global Active Power (kilowatts)")
        dev.off()
	dt
}

