# plot3.R - Line plot 

hpc <- read.table("household_power_consumption.txt", header = TRUE,
                  sep=";",  na.strings="?")

# Reduce data frame to February first and second 2007 dates
hpcSmall <- subset(hpc, hpc$Date == '1/2/2007' | hpc$Date == '2/2/2007')
rm(hpc)

# Convert Date column to Date class
hpcSmall$Date <- strptime(paste(hpcSmall$Date,hpcSmall$Time), "%d/%m/%Y %H:%M:%S")

# Plot first sub metering column
plot(hpcSmall$Date,hpcSmall$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")

# Add connected line segment to plot of second sub metering column
lines(hpcSmall$Date,hpcSmall$Sub_metering_2, type="l", col="red")

# Add connected line segment to plot of third sub metering column
lines(hpcSmall$Date,hpcSmall$Sub_metering_3, type="l", col="blue")

# Add legend that is chopped off improperly TODO: Fix it
legend("topright", legend=names(hpcSmall[7:9]), lty=1, 
       col=c("black", "red", "blue"))

dev.copy(png, 'plot3.png', width = 480, height = 480)
dev.off()
