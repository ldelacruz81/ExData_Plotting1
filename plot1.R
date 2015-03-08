# plot1.R - Plots a histogram of the Global Active Power variable for the dates '2007-02-01' to '2007-02-02'
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

# Plot the histogram and save into .png file
png(filename='plot1.png')
par(bg="transparent")
hist(data$Global_active_power, col='red', xlab='Global Active Power (kilowatts)', main='Global Active Power')
dev.off()
