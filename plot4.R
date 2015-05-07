## read data
setwd("~/Desktop/EDA/")
full_data <- read.csv("~/Desktop/EDA/household_power_consumption.txt", header = T, 
                      sep=";", na.strings = "?")
## clean data

time_data <- full_data[full_data$Date == "1/2/2007" | full_data$Date == "2/2/2007", ]
## set Date and Time as Date/Time
x <- paste(as.Date(time_data$Date, "%d/%m/%Y"), time_data$Time)
time_data$DateTime <- as.POSIXct(x)

time_data <- time_data[, c(10, 3:9)]
## save plot4
png(file = "plot4.png", width=480,height=480,units="px")
par(mfrow = c(2, 2))
with(time_data, {
      plot(DateTime, Global_active_power,ylab="Global Active
           Power (kilowatts)", xlab="", type="l")
      plot(DateTime, Voltage, ylab = "Voltage", xlab = "datetime", type = "l")
      plot(DateTime, Sub_metering_1, col= "black", ylab = "Energy sub metering",
           xlab = "", type = "l")
      
      lines( DateTime, Sub_metering_2, col= "red")
      lines( DateTime, Sub_metering_3, col= "blue")
      legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
             legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
      plot(DateTime, Global_reactive_power, ylab = "Global_reactive_power", 
           xlab = "datetime", type = "l")
})
dev.off()