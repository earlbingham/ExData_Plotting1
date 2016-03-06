# plot1.R - Create barplot of Global Active Power and probability (frequency)

hpc <- read.table("household_power_consumption.txt", header = TRUE,
                  sep=";",  na.strings="?")

# Reduce data frame to February first and second 2007 dates
hpcSmall <- subset(hpc, hpc$Date == '1/2/2007' | hpc$Date == '2/2/2007')
rm(hpc)

# Convert Date column to Date class
hpcSmall$Date <- as.Date(hpcSmall$Date, format="%d/%m/%Y")
str(hpcSmall)

# Convert the Time variable to Time class
hpcSmall$Time <- strptime(paste(hpcSmall$Date, hpcSmall$Time), format="%Y-%m-%d %H:%M:%S")
str(hpcSmall)

# Compute histogram and plot the object of class histogram
hist(hpcSmall$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Copy device output to PNG file
dev.copy(png, 'plot1.png', width = 480, height = 480)
dev.off()
