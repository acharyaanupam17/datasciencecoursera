#Loading necessary libraries and Setting Working Directory
library(data.table)
setwd("C:/Users/anupam.acharya/DataScience/4. Exploratory Data Analysis/Week 1 assignment/")

#Reading all data from the text file and setting the date format
alldata <- fread("./Household Power Consumption/household_power_consumption.txt")
alldata$Date <- as.Date(alldata$Date, tryFormats = c("%d/%m/%Y", "%d-%m-%Y"))

#Subsetting the data
data <- subset(alldata, Date %in% as.Date(c("2007-02-01", "2007-02-02")))
datetime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

#Plotting the histogram to png and setting graphics device to RStudioGD
png("plot2.png", width=480, height=480)
with(data, plot(datetime, as.numeric(Global_active_power), type="l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()