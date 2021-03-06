##setwd("./Documents/Coursera/JHU Data Scinece/4/w1")

##Load the data from the text file into the data variable:
data <- read.table("./household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?")

#Only keep data for 1/2/2007 and 2/2/2007
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

##Convert the column Time to a date_time data type (Use the date from the Date column)
data$Time <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

##Convert the column Date to a date data type
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")

##Generate the fourth plot:
png("plot4.png",480,480)
par(mfrow = c(2,2))

#1
plot(data$Time,data$Global_active_power,  type = "l", xlab = "", ylab = "Global Active Power")

#2
plot(data$Time,data$Voltage,  type = "l", xlab = "datetime", ylab = "Voltage")

#3
plot(data$Time,data$Sub_metering_1,  type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$Time,data$Sub_metering_2,col="red")
lines(data$Time,data$Sub_metering_3,col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),col=c("black","red", "blue"), bty = "n", lty=1, cex=0.8)

#4
plot(data$Time,data$Global_reactive_power,  type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()

