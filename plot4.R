AD <- read.table("household_power_consumption.txt", header = T, sep = ";")  # All Data

#  Get only the target data and assign it to WD: WorkData
WD <- AD[AD$Date == "1/2/2007" | AD$Date == "2/2/2007",]    # string format, not numerical: need ""

rm(AD)      # removes AD from memory
WD$timestamp <- as.POSIXct( paste( WD$Date, WD$Time ), format = "%d/%m/%Y %H:%M:%S" )

WD$Global_active_power <- as.numeric( as.character( WD$Global_active_power ))
WD$Voltage <- as.numeric( as.character( WD$Voltage ))
WD$Sub_metering_1 <- as.numeric( as.character( WD$Sub_metering_1)) # 2 steps since was a factor
WD$Sub_metering_2 <- as.numeric( as.character( WD$Sub_metering_2)) # 2 steps since was a factor
#  Sub_metering_3 is already of numeric class
WD$Global_reactive_power <- as.numeric( as.character( WD$Global_reactive_power ))

str(WD) # Just to be sure...

par( mfrow = c(2, 2), mar = c(5,4,4,2), oma = c(0,0,0,0))

##      Output to con
##      Plot 1, same as plot2.png
plot(WD$timestamp,WD$Global_active_power,type="l", xlab="", ylab="Global Active Power")

##      Plot 2 to create
plot(WD$timestamp, WD$Voltage,col="black", type="l", xlab="datetime", ylab="Voltage")

##      Plot 3 same as plot3.png
plot(WD$timestamp, WD$Sub_metering_1,col="black", type="l", xlab="", ylab="Energy sub metering")
lines(WD$timestamp, WD$Sub_metering_2, col="red")
lines(WD$timestamp, WD$Sub_metering_3, col="blue")
legend("topright", col=c("black","red", "blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),        
       pch = "_", cex = 0.8, bty = "n", seg.len = 2 )

##      Plot 4 to create
plot(WD$timestamp, WD$Global_reactive_power,col="black", type="l", xlab="datetime", ylab="Global_reactive_power")
axis(2, c(0.0, 0.1, 0.2, 0.3, 0.4, 0.5))

##      Output to file: better to use png than dev.copy
png( file = "./plot4.png", width = 480, height = 480, unit = "px")
par( mfrow = c(2, 2), mar = c(5,4,4,2), oma = c(0,0,0,0))

##      Plot 1, same as plot2.png
plot(WD$timestamp,WD$Global_active_power,type="l", xlab="", ylab="Global Active Power")

##      Plot 2 to create
plot(WD$timestamp, WD$Voltage,col="black", type="l", xlab="datetime", ylab="Voltage")

##      Plot 3 same as plot3.png
plot(WD$timestamp, WD$Sub_metering_1,col="black", type="l",xlab="", ylab="Energy sub metering")
lines(WD$timestamp, WD$Sub_metering_2, col="red")
lines(WD$timestamp, WD$Sub_metering_3, col="blue")
legend("topright", col=c("black","red", "blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),        
       pch = "_", cex = 0.8, bty = "n", seg.len = 2 )

##      Plot 4 to create
plot(WD$timestamp, WD$Global_reactive_power,col="black", type="l", xlab="datetime", ylab="Global_reactive_power")
axis(2, c(0.0, 0.1, 0.2, 0.3, 0.4, 0.5))
dev.off()
