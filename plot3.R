data <- read.csv2("household_power_consumption.txt",nrows=1000000)
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
subdata <- data[(data$Date=="2007-02-01" | data$Date == "2007-02-02"),]
subdata$Global_active_power <- as.numeric(as.character(subdata$Global_active_power))

subdata$Date_Time <- strptime(paste(as.character(subdata$Date),as.character(subdata$Time),sep=" "),format="%Y-%m-%d %H:%M:%S")

subdata <- transform(subdata,Sub_metering_1=as.numeric(as.character(Sub_metering_1)))
subdata <- transform(subdata,Sub_metering_2=as.numeric(as.character(Sub_metering_2)))
subdata <- transform(subdata,Sub_metering_3=as.numeric(as.character(Sub_metering_3)))

png("plot3.png", 480, 480)

with(subdata,plot(Date_Time,Sub_metering_1,type="l",ylab="Energy sub metering",xlab = ""))
with(subdata,lines(Date_Time,Sub_metering_2,col="red"))
with(subdata,lines(Date_Time,Sub_metering_3,col="blue"))
legend("topright",lty=1, col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()


