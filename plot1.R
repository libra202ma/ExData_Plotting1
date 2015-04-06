data <- read.csv2("household_power_consumption.txt",nrows=1000000)
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
subdata <- data[(data$Date=="2007-02-01" | data$Date == "2007-02-02"),]
subdata$Global_active_power <- as.numeric(as.character(subdata$Global_active_power))

hist(subdata$Global_active_power,col="red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power")
dev.copy(png,file="plot1.png")
dev.off()