#This is the R script for creating plot4.png

#read data only from the used data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "electric power consumption.zip")
unzip("electric power consumption.zip")
namescol<- read.table("household_power_consumption.txt",sep = ";",skip = 0, nrow = 1)
data<- read.table("household_power_consumption.txt",sep = ";",
                  skip = grep("1/2/2007", readLines("household_power_consumption.txt"))-1, 
                  nrow = 60*24*2)
#change date format
data$V1 <- as.Date(data$V1, format = "%d/%m/%Y")


#create plot 4
png(file = "plot4.png")
par(mfrow = c(2,2), mar = c(4,4,2,2))

#topleft plot
with(data,plot(V2, V3, 
               xaxt = "n", 
               ylab = "Global Active Power"))
axis(1, at=c(1,30*24,60*24), labels = c("Thu", "Fri", "Sat"))

#topright plot
with(data, plot(V2, V5, 
                type = "l",
                xaxt = "n", 
                ylab = "Voltage", 
                xlab = "datetime"))
axis(1, at=c(1,30*24,60*24), labels = c("Thu", "Fri", "Sat"))

#downleft plot
with(data, plot(V2, V7, 
                type = "l", 
                xaxt = "n", 
                ylab = "Energy sub metering"))
with(data, lines(V2, V8, col = "red"))
with(data, lines(V2, V9, col = "blue"))
axis(1, at=c(1,30*24,60*24), labels = c("Thu", "Fri", "Sat"))
legend("topright", 
       pch = "_", 
       col = c("black", "blue", "red") , 
       legend = c("Sub_metering_1",  "Sub_metering_2", "Sub_metering_3"), 
       cex = 0.75)

#downright plot
with(data, plot(V2, V4, 
                type = "l", 
                xlab = "datetime",
                ylab = "Global_reactive_power",
                xaxt = "n"))
axis(1, at=c(1,30*24,60*24), labels = c("Thu", "Fri", "Sat"))
dev.off()    