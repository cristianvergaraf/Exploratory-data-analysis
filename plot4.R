graph4 <- function(){

    Sys.setlocale("LC_ALL","C")
    names <- read.table("household_power_consumption.txt", sep = ";", header = FALSE, na.strings = "?", nrows = 1, stringsAsFactors = FALSE)
    data <- read.table("household_power_consumption.txt", sep = ";", header = FALSE, na.strings = "?", skip = 1, stringsAsFactors = FALSE)
    colnames(data) <- names
    data$Date <- (paste(data$Date,data$Time))
    data$Date <- strptime(data$Date, format = "%d/%m/%Y %H:%M:%S")
    sub <- subset(data, Date > "2007-01-31 23:59:59" & Date < "2007-02-03 00:00:00")
    png('graph4.png', width = 480, height = 480)
    par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
    plot(sub$Date, sub$Global_active_power, ylab = "Global Active Power", xlab = "", "l")
    plot(sub$Date, sub$Voltage, ylab = "Voltage", xlab = "datetime", "l")
    plot(sub$Date, sub$Sub_metering_1, "l", ylab = "Energy sub metering", xlab = "" )
    lines(sub$Date, sub$Sub_metering_2, col = "red")
    lines(sub$Date, sub$Sub_metering_3, col = "blue")
    label <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    legend("topright", legend = label, lwd=3, col=c("black", "red", "blue"), bty = "n",  xjust = 0)
    plot(sub$Date, sub$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", "l")

