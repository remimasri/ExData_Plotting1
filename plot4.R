plot4 <- function(){
  
  
  
  #Read data from file
  dfrm <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
  
  #Converting data, time and global active power to the right format
  #Subset from 2007-02-1 to 2007-02-02
  dfrm$Date <- as.Date(dfrm$Date, "%d/%m/%Y")
  sample <- subset(dfrm, subset= (Date >= "2007-02-01" & Date <= "2007-02-02"))
  sample$Date <- paste(sample$Date, sample$Time, sep=" ")
  sample$Global_active_power <- as.numeric(as.character(sample$Global_active_power))
  sample$Date <- strptime(sample$Date, format='%Y-%m-%d %H:%M:%S')
  
  #Create png file of the plot
  png("plot4.png", width = 480, height = 480)
  par(mfrow= c(2,2))
  #plot top left
  plot(sample$Date, sample$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  
  #plot top right
  sample$Voltage <- as.numeric(as.character(sample$Voltage))
  plot(sample$Date, sample$Voltage, type="l", xlab="datetime", ylab="Voltage")
  
  #plot bottom left
  sample$Sub_metering_1 <- as.numeric(as.character(sample$Sub_metering_1))
  sample$Sub_metering_2 <- as.numeric(as.character(sample$Sub_metering_2))
  sample$Sub_metering_3 <- as.numeric(as.character(sample$Sub_metering_3))
  
  plot(sample$Date, sample$Sub_metering_1, type="l", col="black", ylab="Energy Sun Metering", xlab="")
  lines(sample$Date, sample$Sub_metering_3, type="l", col="blue")
  lines(sample$Date, sample$Sub_metering_2, type="l", col="red")
  legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty="solid", horiz=FALSE, cex=1, bg = "transparent", bty="n")
  
  #plot bottom right
  sample$Global_reactive_power <- as.numeric(as.character(sample$Global_reactive_power))
  plot(sample$Date, sample$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  
  dev.off()
  
  
}