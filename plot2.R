# pre-condition: prepareDataSet.R was called
plot2 <- function(file = "household_power_consumption_02_2007.txt") {
	dt <- read.table("household_power_consumption_02_2007.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)
        png(filename="plot2.png")
	dt$date_time <- as.POSIXct(dt$date_time)
	plot(dt$date_time, dt$Global_active_power, "l", xlab = "", ylab = "Global Active Power (kilowatts)")
        dev.off()
	message("plot2.png was created successfully")
}

