Plot3 <- function() {
     data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
     data$Date <- as.Date(data$Date,format="%d/%m/%Y")
     filter <- (data$Date == "2007-02-01") | (data$Date == "2007-02-02")
     subdata <- data[filter,]
     subdata$Time <- strptime(x=paste(as.character(subdata$Date)," ", as.character(subdata$Time)),format="%Y-%m-%d %H:%M:%S")
     
     png(filename="plot3.png")
     
     plot(subdata$Time,subdata$Sub_metering_1,type="l",xaxt="n",xlab = "", ylab = "Energy sub metering")
     lines(subdata$Time,subdata$Sub_metering_2, col="red")
     lines(subdata$Time,subdata$Sub_metering_3, col="blue")
     legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
     axis.POSIXct(1,subdata$Time, format="%a")
     
     dev.off()
}