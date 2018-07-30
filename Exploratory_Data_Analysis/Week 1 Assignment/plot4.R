library(data.table)
setwd("C:/Users/anupam.acharya/DataScience/4. Exploratory Data Analysis/Week 1 assignment/")

#Reading all data from the text file and setting the date format
alldata <- fread("./Household Power Consumption/household_power_consumption.txt")
alldata$Date <- as.Date(alldata$Date, tryFormats = c("%d/%m/%Y", "%d-%m-%Y"))

#Subsetting the data
data <- subset(alldata, Date %in% as.Date(c("2007-02-01", "2007-02-02")))
datetime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

#Plotting the histogram to png and setting graphics device to RStudioGD
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
with(data, plot(datetime, as.numeric(Global_active_power), type="l", ylab="Global Active Power", xlab=""))
with(data, plot(datetime, as.numeric(Voltage), type="l", ylab="Global Active Power (kilowatts)", xlab="datetime"))
with(data, {plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col = "black")
    lines(data$Sub_metering_2~datetime,col='Red')
    lines(data$Sub_metering_3~datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
with(data, plot(datetime, as.numeric(Global_reactive_power), type="l", ylab="Global_reactive_power", xlab=""))
dev.off()