##read data
Sys.setlocale("LC_TIME", "English")
setwd("exdata_data_household_power_consumption")
powerconsumption <- read.csv2("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE)

##assign proper classes to dataset
powerconsumption$Date <- as.Date(powerconsumption$Date, "%d/%m/%Y")
powerconsumption <- subset(powerconsumption, powerconsumption$Date == as.Date("01/02/2007", "%d/%m/%Y") | powerconsumption$Date == as.Date("02/02/2007", "%d/%m/%Y"))
powerconsumption$Global_active_power <- as.numeric(powerconsumption$Global_active_power)
powerconsumption$Global_reactive_power <- as.numeric(powerconsumption$Global_reactive_power)
powerconsumption$Voltage<- as.numeric(powerconsumption$Voltage)
powerconsumption$Global_intensity <- as.numeric(powerconsumption$Global_intensity)
powerconsumption$Sub_metering_1 <- as.numeric(powerconsumption$Sub_metering_1)
powerconsumption$Sub_metering_2 <- as.numeric(powerconsumption$Sub_metering_2)
powerconsumption$Sub_metering_3 <- as.numeric(powerconsumption$Sub_metering_3)
powerconsumption$Time <- format(powerconsumption$Time, "%H:%M:%S", usetz = FALSE)
datetime <- paste(powerconsumption$Date, powerconsumption$Time)
powerconsumption$Datetime <- as.POSIXct(datetime)


## set device
png(filename="plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2), mar=c(4, 4, 2, 1), oma=c(0, 0, 2, 0))

##plot 4
##plot graphic 1
with(powerconsumption, {
        plot(powerconsumption$Global_active_power ~ powerconsumption$Datetime, type="l",
             ylab = "Global Active Power")
})

##plot graphic 2
with(powerconsumption, {
        plot(powerconsumption$Voltage ~ powerconsumption$Datetime, type="l",
             ylab = "Voltage",
             xlab = "datetime")
})

##plot graphic 3
with(powerconsumption, {
        plot(powerconsumption$Sub_metering_1 ~ powerconsumption$Datetime, type="l",
             ylab = "Energy sub metering",
             xlab = "")
        lines(powerconsumption$Sub_metering_2 ~ powerconsumption$Datetime, col = "red")
        lines(powerconsumption$Sub_metering_3 ~ powerconsumption$Datetime, col = "blue")
})
legend("topright", 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, 
       lwd = 2,
       bty = "n")

##plot graphic 4
with(powerconsumption, {
        plot(powerconsumption$Global_reactive_power ~ powerconsumption$Datetime, type="l",
             ylab = "Global_reactive_power",
             xlab = "datetime")
})
        
## turn device off
dev.off()