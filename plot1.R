##read data
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
powerconsumption$Time <- strptime(powerconsumption$Time, "%H:%M:%S")


## set device
png(filename="plot1.png", width = 480, height = 480, units = "px")

##plot graphic 1
hist(powerconsumption$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     ylim = c(0,1300))

## turn device off
dev.off()