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
## save plot2
png(file = "plot2.png", width=480,height=480,units="px")
plot(time_data$DateTime, time_data$Global_active_power,ylab="Global Active Power (kilowatts)", xlab="", type="l")
dev.off()