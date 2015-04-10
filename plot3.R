graph3 <- function(){
 
    Sys.setlocale("LC_ALL","C")
    names <- read.table("household_power_consumption.txt", sep = ";", header = FALSE, na.strings = "?", nrows = 1, stringsAsFactors = FALSE)
    data <- read.table("household_power_consumption.txt", sep = ";", header = FALSE, na.strings = "?", skip = 1, stringsAsFactors = FALSE)
    colnames(data) <- names
    data$Date <- (paste(data$Date,data$Time))
    data$Date <- strptime(data$Date, format = "%d/%m/%Y %H:%M:%S")
    sub <- subset(data, Date > "2007-01-31 23:59:59" & Date < "2007-02-03 00:00:00")
    png('graph3.png', width = 480, height = 480)
    plot(sub$Date, sub$Sub_metering_1, "l", ylab = "Energy sub metering", xlab = "" )
    lines(sub$Date, sub$Sub_metering_2, col = "red")
    lines(sub$Date, sub$Sub_metering_3, col = "blue")
    label <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    legend("topright", legend = label, lwd=3, col=c("black", "red", "blue") )
    
  
  }
