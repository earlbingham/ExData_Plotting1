# plot4.R - Create 4 plots

hpc <- read.table("household_power_consumption.txt", header = TRUE,
                  sep=";",  na.strings="?")

# Reduce data frame to February first and second 2007 dates
hpcSmall <- subset(hpc, hpc$Date == '1/2/2007' | hpc$Date == '2/2/2007')
rm(hpc)

# Convert Date and Time columns to Date class
hpcSmall$Date <- strptime(paste(hpcSmall$Date, hpcSmall$Time), "%d/%m/%Y %H:%M:%S")

# Set graphical parameters
par(mfcol=c(2,2))

# Top left
plot(hpcSmall$Date, hpcSmall$Global_active_power, type="l", ylab="Global Active Power", xlab="")

# Bottom left
plot(hpcSmall$Date, hpcSmall$Sub_metering_1, type="l",ylab="Energy sub metering",xlab="")
lines(hpcSmall$Date, hpcSmall$Sub_metering_2, type="l", col="red")
lines(hpcSmall$Date, hpcSmall$Sub_metering_3, type="l", col="blue")
# Legend border not visible, font adjusted
legend("topright", box.lwd=0, legend=names(hpcSmall[7:9]), lty=1, col=c("black","red","blue"), cex=0.8)

# Top right
plot(hpcSmall$Date, hpcSmall$Voltage, type="l", ylab="Voltage", xlab="datetime")

# Bottom right
plot(hpcSmall$Date, hpcSmall$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")


dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
