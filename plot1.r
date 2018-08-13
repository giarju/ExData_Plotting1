#This is the R script for creating plot1.png

#read data only from the used data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "electric power consumption.zip")
unzip("electric power consumption.zip")
namescol<- read.table("household_power_consumption.txt",sep = ";",skip = 0, nrow = 1)
data<- read.table("household_power_consumption.txt",sep = ";",
                      skip = grep("1/2/2007", readLines("household_power_consumption.txt"))-1, 
                      nrow = 60*24*2)
#change date format
data$V1 <- as.Date(data$V1, format = "%d/%m/%Y")


#create plot 1
png(file = "plot1.png")
hist(data$V3, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()
