#This is the R script for creating plot3.png

#read data only from the used data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "electric power consumption.zip")
unzip("electric power consumption.zip")
namescol<- read.table("household_power_consumption.txt",sep = ";",skip = 0, nrow = 1)
data<- read.table("household_power_consumption.txt",sep = ";",
                  skip = grep("1/2/2007", readLines("household_power_consumption.txt"))-1, 
                  nrow = 60*24*2)
#change date format
data$V1 <- as.Date(data$V1, format = "%d/%m/%Y")

#create plot 3
png(file = "plot3.png")
with(data, plot(V2, V7, 
                type = "l", 
                xaxt = "n", 
                ylab = "Energy sub metering"))
with(data, lines(V2, V8, col = "red"))
with(data, lines(V2, V9, col = "blue"))
axis(1, at=c(1,30*24,60*24), labels = c("Thu", "Fri", "Sat"))            #change labels
legend("topright", 
       pch = "_", col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1",  "Sub_metering_2", "Sub_metering_3"))
dev.off()