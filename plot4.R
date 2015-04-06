data <- read.csv2("household_power_consumption.txt",nrows=1000000)
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
subdata <- data[(data$Date=="2007-02-01" | data$Date == "2007-02-02"),]

subdata$Date_Time <- strptime(paste(as.character(subdata$Date),as.character(subdata$Time),sep=" "),format="%Y-%m-%d %H:%M:%S")

subdata <- transform(subdata,
                     Global_active_power = as.numeric(as.character(Global_active_power)),
                     Global_reactive_power = as.numeric(as.character(Global_reactive_power)),
                     Sub_metering_1=as.numeric(as.character(Sub_metering_1)),
                     Sub_metering_2=as.numeric(as.character(Sub_metering_2)),
                     Sub_metering_3=as.numeric(as.character(Sub_metering_3)),
                     Voltage = as.numeric(as.character(subdata$Voltage)))

png("plot4.png", 640, 580)

par(mfrow = c(2,2))
with(subdata,{
        plot(Date_Time,Global_active_power,"l",ylab="Global Active Power",xlab = "")
        plot(Date_Time,Voltage,"l",ylab="Voltage",xlab="datetime")
        plot(Date_Time,Sub_metering_1,type="l",ylab="Energy sub metering",xlab = "")
                lines(Date_Time,Sub_metering_2,col="red")
                lines(Date_Time,Sub_metering_3,col="blue")
                legend("topright",lty=1, col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
        plot(Date_Time,Global_reactive_power,"l",ylab="Global_reactive_power",xlab="datetime")       
})
                     

dev.off()

