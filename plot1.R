##read data
setwd("~/Desktop/EDA/")
full_data <- read.csv("~/Desktop/EDA/household_power_consumption.txt", header = T, 
                      sep=";", na.strings = "?")
## clean data

time_data <- full_data[full_data$Date == "1/2/2007" | full_data$Date == "2/2/2007", ]

## save plot1
png(file = "plot1.png", width=480,height=480,units="px")
with (time_data, hist(time_data$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red"))
dev.off()