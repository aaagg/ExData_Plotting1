#Loading the data

power_data <- read.delim(file.choose(),sep =";", header = TRUE)
power_subdata <- subset(power_data,Date=="1/2/2007" | Date=="2/2/2007")

#plot 1
hist(as.numeric(as.character(power_subdata$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
     