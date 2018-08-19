#This is the R script for creating plot4.png

#read data only from the used data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "electric power consumption.zip")
unzip("electric power consumption.zip")
data <- read.table("household_power_consumption.txt",sep = ";",na.strings = "?", header = TRUE)

#change date format and subset data
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data_used <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
data_used$datetime <- strptime(paste(data_used$Date, data_used$Time), "%Y-%m-%d %H:%M:%S")


#create plot 4
png(file = "plot4.png", height = 480, width = 480, units = 'px')
par(mfrow = c(2,2), mar = c(4,4,2,2))

#topleft plot
with(data_used,plot(datetime, Global_active_power, 
               type = "l",
               ylab = "Global Active Power",
               xlab = ""))

#topright plot
with(data_used, plot(datetime, Voltage, 
                type = "l",
                ylab = "Voltage", 
                xlab = "datetime"))

#downleft plot
with(data_used, plot(datetime, Sub_metering_1, 
                     type = "l", 
                     ylab = "Energy sub metering",
                     xlab = ""))
with(data_used, lines(datetime, Sub_metering_2, col = "red"))
with(data_used, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", 
       pch = "_", col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1",  "Sub_metering_2", "Sub_metering_3"), cex = 0.9)

#downright plot
with(data_used, plot(datetime, Global_reactive_power, 
                type = "l", 
                xlab = "datetime",
                ylab = "Global_reactive_power"))
dev.off()    