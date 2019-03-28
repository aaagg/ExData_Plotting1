#Loading the data

power_data <- read.delim(file.choose(),sep =";", header = TRUE)
power_subdata <- subset(power_data,Date=="1/2/2007" | Date=="2/2/2007")


power_subdata$Date <- as.Date(power_subdata$Date,format="%d/%m/%y")
power_subdata$Time <- strptime(power_subdata$Time,"%H:%M:%S")
power_subdata[1:1440,"Time"] <- format(power_subdata[1:1440,"Time"],"2007-02-01 %H:%M:%S")
power_subdata[1441:2880,"Time"] <- format(power_subdata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#plot 3
plot(power_subdata$Time,power_subdata$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(power_subdata,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(power_subdata,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(power_subdata,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  