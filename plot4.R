# pre-condition: prepareDataSet.R was called
plot4 <- function(file = "household_power_consumption_02_2007.txt") {
	dt <- read.table("household_power_consumption_02_2007.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)
        dt$date_time <- as.POSIXct(dt$date_time)
	png(filename="plot4.png")
	par(mfrow=c(2,2))

        ## ------------------------
        ##          plot 1
        ## ------------------------
        plot(dt$date_time, dt$Global_active_power, "l", xlab = "", ylab = "Global Active Power")

        ## ------------------------
        ##          plot 2
        ## ------------------------
        plot(dt$date_time, dt$Voltage, "l", xlab = "datetime", ylab = "Voltage")

        ## ------------------------
        ##          plot 3
        ## ------------------------
	plot(dt$date_time, dt$Sub_metering_1, "l", xlab = "", ylab = "Energy sub metering")
	par(col="red")
        lines(dt$date_time, dt$Sub_metering_2, "l")
	par(col="blue")
	lines(dt$date_time, dt$Sub_metering_3, "l")
        par(col="black")
	legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c('black', 'red', 'blue'), bty = "n", lty=1)

        ## ------------------------
        ##          plot 4
        ## ------------------------
        plot(dt$date_time, dt$Global_reactive_power, "l", xlab = "datetime", ylab = "Global_reactive_power")

	dev.off()
	message("plot4.png was created successfully")
}

