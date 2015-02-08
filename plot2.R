AD <- read.table("household_power_consumption.txt", header = T, sep = ";")  # All Data
#head(AD)

WD <- AD[AD$Date == "1/2/2007" | AD$Date == "2/2/2007",]    # string format, not numerical: need ""
WD$timestamp <- as.POSIXct( paste( WD$Date, WD$Time ), format = "%d/%m/%Y %H:%M:%S" )
names(WD)
str(WD$timestamp)

rm(AD)      # removes AD from memory

# str(WD$Global_active_power) 
## See http://stackoverflow.com/questions/3418128/how-to-convert-a-factor-to-an-integer-numeric-without-a-loss-of-information
WD$Global_active_power <- as.numeric( as.character( WD$Global_active_power )) # 2 steps since was a factor
str(WD$Global_active_power) 

par(mar=c(rep(5,4)))
plot(WD$timestamp,WD$Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowatts)")


dev.copy(png, file = "plot2.png") ## Copy my plot to a PNG file at the default res. of 480 x 480
dev.off()
