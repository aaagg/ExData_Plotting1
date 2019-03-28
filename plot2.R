#Loading the data

power_data <- read.delim(file.choose(),sep =";", header = TRUE)
power_subdata <- subset(power_data,Date=="1/2/2007" | Date=="2/2/2007")


power_subdata$Date <- as.Date(power_subdata$Date,format="%d/%m/%y")
power_subdata$Time <- strptime(power_subdata$Time,"%H:%M:%S")
power_subdata[1:1440,"Time"] <- format(power_subdata[1:1440,"Time"],"2007-02-01 %H:%M:%S")
power_subdata[1441:2880,"Time"] <- format(power_subdata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


#plot 2
plot(power_subdata$Time,as.numeric(as.character(power_subdata$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)")
