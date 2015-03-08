Plot2 <- function() {
     data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
     data$Date <- as.Date(data$Date,format="%d/%m/%Y")
     filter <- (data$Date == "2007-02-01") | (data$Date == "2007-02-02")
     subdata <- data[filter,]
     subdata$Time <- strptime(x=paste(as.character(subdata$Date)," ", as.character(subdata$Time)),format="%Y-%m-%d %H:%M:%S")

     png(filename="plot2.png")

     plot(subdata$Time,subdata$Global_active_power,type="l",xaxt="n",xlab = "", ylab = "Global Active Power (kilowatts)")
     axis.POSIXct(1,subdata$Time, format="%a")

     dev.off()
}