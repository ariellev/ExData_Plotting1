## the function:
## subsets the data set to 1+2 Feb 2007
## adds date_time variable
## writes the data set into a file

prepareDataSet <- function(file = "household_power_consumption.txt", zipFile = "exdata-data-household_power_consumption.zip") {
        ## ------------------------
        ##      setting up
        ## ------------------------
	## pre condition - verifying that data set exists
	## if not, it will be downloaded and extracted
	if (!file.exists(file)) {
		 message("Couldn't find data set. Trying out the zip file..")
		 if (!file.exists(zipFile)) {
                	message("Couldn't find zip. Downloading...")
			status <- download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile=zipFile, method = "curl")
                	if (status != 0) {
                        	## error downloading file
                        	stop(paste("error downloading zip file, status=", status))
               		 }		 
		}
		message("extracting dataset from zip file")
		unzip(zipFile)
		file <- "household_power_consumption.txt"
	}


	# skip + nrows were determinde using shell grep
	# grep -n "31/1/2007" household_power_consumption.txt
	# grep -n "^2/2/2007" household_power_consumption.txt

	dt <- read.table(file, sep=";", skip=66637, nrows=2880, header=FALSE, stringsAsFactors=FALSE)
	dt <- dt[complete.cases(dt), ]	
	
	# fetching col names
        col_names <- read.table(file, sep=";", nrows=1, header=TRUE)
	names(dt) <- names(col_names)

	# adding unified data_time variable
        date_time <- paste(dt$Date, dt$Time)
        date_time <- strptime(date_time, format="%d/%m/%Y %H:%M:%S")
        dt$date_time <- date_time

	file_name <- "household_power_consumption_02_2007.txt"
	write.table(dt, file=file_name, sep=";", col.names=TRUE)
	message(paste0("dataset prepared successfully, file=", file_name))
	dt
}
