AD <- read.table("household_power_consumption.txt", header = T, sep = ";")  # All Data

#  Get only the target data and assign it to WD: WorkData
WD <- AD[AD$Date == "1/2/2007" | AD$Date == "2/2/2007",]    # string format, not numerical: need ""

rm(AD)      # removes AD from memory
WD$timestamp <- as.POSIXct( paste( WD$Date, WD$Time ), format = "%d/%m/%Y %H:%M:%S" )

WD$Sub_metering_1 <- as.numeric( as.character( WD$Sub_metering_1)) # 2 steps since was a factor
WD$Sub_metering_2 <- as.numeric( as.character( WD$Sub_metering_2)) # 2 steps since was a factor
#  Sub_metering_3 is already of numeric class
str(WD)

par(mar=c(3,4,2,2))

plot(WD$timestamp, WD$Sub_metering_1,col="black", type="l", xlab="", ylab="Energy sub metering")
lines(WD$timestamp, WD$Sub_metering_2, col="red")
lines(WD$timestamp, WD$Sub_metering_3, col="blue")

legend("topright", col=c("black","red", "blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),        
       pch = "_", cex = 0.8 )

png( file = "./plot3.png", width = 480, height = 480, unit = "px")
plot(WD$timestamp, WD$Sub_metering_1,col="black", type="l", xlab="", ylab="Energy sub metering")
lines(WD$timestamp, WD$Sub_metering_2, col="red")
lines(WD$timestamp, WD$Sub_metering_3, col="blue")

legend("topright", col=c("black","red", "blue"),
        legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),        
        pch = "_", cex = 0.8)

dev.off()
