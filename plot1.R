# pre-condition: prepareDataSet.R was called
plot1 <- function(file = "household_power_consumption_02_2007.txt") {
	dt <- read.table("household_power_consumption_02_2007.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)
	dt$Global_active_power <- sapply(dt$Global_active_power, as.numeric)
	png(filename="plot1.png")
	hist(dt$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
	dev.off()
	message("plot1.png was created successfully")
}
