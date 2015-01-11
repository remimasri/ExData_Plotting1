
plot2 <- function(){
  
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
  png("plot2.png", width = 480, height = 480)
  plot(sample$Date, sample$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  dev.off()
    
}