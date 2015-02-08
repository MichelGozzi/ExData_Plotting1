AD <- read.table("household_power_consumption.txt", header = T, sep = ";")  # All Data

AD$Date <- as.Date( AD$Date, "%d/%m/%Y" )   # Use the ..$Date format

WD <- AD[AD$Date == "2007-02-01" | AD$Date == "2007-02-02",]    # string format, not numerical: need ""

rm(AD)      # removes AD from memory

## When you directly convert a factor into a numeric the result is not the levels themselves
## as a numeric but rather the underlying integers R uses to code the different levels.
## In general, if you want to convert a factor into a numeric then you first need to convert
## the factor into a character vector (using as.character) and then convert that character
## vector into a numeric vector using as.numeric.
WD$Global_active_power <- as.numeric( as.character( WD$Global_active_power ))

par(mar=c(rep(5,4)))    # enough room for axis labels
axis(2, c(0,200,400,600,800,1000,1200)) # the 1200 wasn't on the plot
hist(WD$Global_active_power, col = "red", main = "Global Active Power", xlab="Global Active Power (kilowatts)", ylab = "Frequency")

dev.copy(png, file = "plot1.png") ## Copy my plot to a PNG file at the default res. of 480 x 480
dev.off()
