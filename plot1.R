##setwd("./Documents/Coursera/JHU Data Scinece/4/w1")

##Load the data from the text file into the data variable:
data <- read.table("./household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?")

#Only keep data for 1/2/2007 and 2/2/2007
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

##Convert the column Time to a date_time data type (Use the date from the Date column)
data$Time <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

##Convert the column Date to a date data type
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")

##Generate the first plot:
png("plot1.png",480,480)
hist(data$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()