#This is the R script for creating plot3.png

#read data only from the used data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "electric power consumption.zip")
unzip("electric power consumption.zip")
data <- read.table("household_power_consumption.txt",sep = ";",na.strings = "?", header = TRUE)

#change date format and subset data
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data_used <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
data_used$datetime <- strptime(paste(data_used$Date, data_used$Time), "%Y-%m-%d %H:%M:%S")

#create plot 3
png(file = "plot3.png", height = 480 , width = 480 , units = 'px')
with(data_used, plot(datetime, Sub_metering_1, 
                type = "l", 
                ylab = "Energy sub metering",
                xlab = ""))
with(data_used, lines(datetime, Sub_metering_2, col = "red"))
with(data_used, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", 
       pch = "_", col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1",  "Sub_metering_2", "Sub_metering_3"))
dev.off()