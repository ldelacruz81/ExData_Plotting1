# plot2.R - Plots a line graph of Global Active Power variable for the dates '2007-02-01' to '2007-02-02'
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

# Plot the line graph and save into .png file
png(filename='plot2.png')
par(bg="transparent")
plot(data$DateTime, data$Global_active_power, "l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
