Sys.setlocale("LC_TIME", "English")
monitorDataPath <- "../data/household_power_consumption.txt"
monitorData <- read.table( monitorDataPath , header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSet <- monitorData[monitorData$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subSet$Date, subSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(subSet$Global_active_power)
submetering1 <- as.numeric(subSet$Sub_metering_1)
submetering2 <- as.numeric(subSet$Sub_metering_2)
submetering3 <- as.numeric(subSet$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(datetime, submetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()