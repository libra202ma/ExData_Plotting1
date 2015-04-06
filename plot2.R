data <- read.csv2("household_power_consumption.txt",nrows=1000000)
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
subdata <- data[(data$Date=="2007-02-01" | data$Date == "2007-02-02"),]
subdata$Global_active_power <- as.numeric(as.character(subdata$Global_active_power))

subdata$Date_Time <- strptime(paste(as.character(subdata$Date),as.character(subdata$Time),sep=" "),format="%Y-%m-%d %H:%M:%S")
with(subdata,plot(Date_Time,Global_active_power,"l",ylab="Global Active Power (kilowatts)",xlab = ""))

dev.copy(png,file="plot2.png")
dev.off()
