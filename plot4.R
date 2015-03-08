# plot4.R - Plots four graphs in one
# Author - Lauro I. Dela Cruz
# Date - March 8, 2015

# Download zipped file
setInternet2(use = TRUE)
zipFile <- "exdata_data_household_power_consumption.zip"
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,destfile=zipFile)

# Unzip zipped file and read into data frame
datafile <- "household_power_consumption.txt"
data <- read.csv(unz(zipFile,datafile), header=T, sep=';', dec='.', na.strings = '?')

# Select data that fall on the given dates
data <- subset(data, Date %in% c('1/2/2007', '2/2/2007'))

# Combine first and second columns to create DateTime column
data$DateTime <- as.POSIXlt(paste(as.character(data$Date), as.character(data$Time)), format="%d/%m/%Y %H:%M:%S")

# Plot the four graphs and save into .png file
png(filename='plot4.png')
par(mfrow=c(2, 2))
par(bg="transparent")
plot(data$DateTime, data$Global_active_power, "l", xlab="", ylab="Global Active Power")
plot(data$DateTime, data$Voltage, "l", xlab="", ylab="Voltage")
plot(data$DateTime, data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_1, col="black")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", pch=151, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
plot(data$DateTime, data$Global_reactive_power, "l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
