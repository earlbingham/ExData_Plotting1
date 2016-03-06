# plot2.R - Create Line Plot of global active power kilowatts recorded

hpc <- read.table("household_power_consumption.txt", header = TRUE,
                  sep=";",  na.strings="?")

# Reduce data frame to February first and second 2007 dates
hpcSmall <- subset(hpc, hpc$Date == '1/2/2007' | hpc$Date == '2/2/2007')
rm(hpc)

# Convert Date column to Date class
hpcSmall$Date <- strptime(paste(hpcSmall$Date,hpcSmall$Time), "%d/%m/%Y %H:%M:%S")

# Create line plot
plot(hpcSmall$Date,hpcSmall$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)",xlab="")

dev.copy(png,'plot2.png',  width = 480, height = 480)
dev.off()
