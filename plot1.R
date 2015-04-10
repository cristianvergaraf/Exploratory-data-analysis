graph1 <- function(){

    Sys.setlocale("LC_ALL","C")
    names <- read.table("household_power_consumption.txt", sep = ";", header = FALSE, na.strings = "?", nrows = 1, stringsAsFactors = FALSE)
    data <- read.table("household_power_consumption.txt", sep = ";", header = FALSE, na.strings = "?", skip = 1, stringsAsFactors = FALSE)
    colnames(data) <- names
    data$Date <- (paste(data$Date,data$Time))
    data$Date <- strptime(data$Date, format = "%d/%m/%Y %H:%M:%S")
    sub <- subset(data, Date > "2007-01-31 23:59:59" & Date < "2007-02-03 00:00:00")
    png('graph1.png', width = 480, height = 480)
    hist(sub$Global_active_power, col = "red", breaks = 12, ylab = "Frequency", xlab = "Global Active Power(kilowatts)", main = "Global Active Power")

}

