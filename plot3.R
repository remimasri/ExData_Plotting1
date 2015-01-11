
plot3 <- function(){
  
  #Read data from file
  dfrm <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
  dfrm$Date <- as.Date(dfrm$Date, "%d/%m/%Y")
  
  #Converting data, time and global active power to the right format
  #Subset from 2007-02-1 to 2007-02-02
  sample <- subset(dfrm, subset= (Date >= "2007-02-01" & Date <= "2007-02-02"))
  sample$Date <- paste(sample$Date, sample$Time, sep=" ")
  sample$Date <- strptime(sample$Date, format='%Y-%m-%d %H
                          :%M:%S')
  #Convert the sub_meterings as numeric values
  sample$Sub_metering_1 <- as.numeric(as.character(sample$Sub_metering_1))
  sample$Sub_metering_2 <- as.numeric(as.character(sample$Sub_metering_2))
  sample$Sub_metering_3 <- as.numeric(as.character(sample$Sub_metering_3))
  
  #Plot the three sub meterings with the correct colours
  png("plot3.png", width = 480, height = 480)
  plot(sample$Date, sample$Sub_metering_1, type="l", col="black", ylab="Energy Sun Metering", xlab="")
  lines(sample$Date, sample$Sub_metering_3, type="l", col="blue")
  lines(sample$Date, sample$Sub_metering_2, type="l", col="red")
  legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty="solid", horiz=FALSE, cex=1)
  dev.off()
}