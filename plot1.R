cleanDataSet <- function(file = "household_power_consumption.txt") {

	# skip + nrows were determinde using shell grep
	# grep -n "31/1/2007" household_power_consumption.txt
	# grep -n "^2/2/2007" household_power_consumption.txt

	dt <- read.table(file, sep=";", skip=66637, nrows=2880, header=FALSE, stringsAsFactors=FALSE)
	dt <- dt[complete.cases(dt), ]	
	
	# fetching col names
        col_names <- read.table(file, sep=";", nrows=1, header=TRUE)
	names(dt) <- names(col_names)

	write.table(dt, file="household_power_consumption_02_2007.txt", sep=";", col.names=TRUE)
	dt
}

plot1 <- function(file = "household_power_consumption_02_2007.txt") {
	dt <- read.table("household_power_consumption_02_2007.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)
	dt$Global_active_power <- sapply(dt$Global_active_power, as.numeric)
	png(filename="plot1.png")
	hist(dt$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
	dev.off()
	dt
}
