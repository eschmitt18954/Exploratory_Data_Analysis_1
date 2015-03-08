Plot1 <- function() {
     
     data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
     data$Date <- as.Date(data$Date,format="%d/%m/%Y")
     filter <- (data$Date == "2007-02-01") | (data$Date == "2007-02-02")
     subdata <- data[filter,]
     subdata$Time <- strptime(x=paste(as.character(subdata$Date)," ", as.character(subdata$Time)),format="%Y-%m-%d %H:%M:%S")

     png(filename="plot1.png")
     hist(subdata$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
     dev.off()
}