
plot1 <- function(){  

  #Read data from file
  dfrm <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
  
  #Convert values to rigth format and take data from 2007-02-01 to 2007-02-02
  dfrm$Date <- as.Date(dfrm$Date, "%d/%m/%Y")
  sample <- subset(dfrm, subset= (Date >= "2007-02-01" & Date <= "2007-02-02"))
  sample$Global_active_power <- as.numeric(as.character(sample$Global_active_power))
  
  #Creating a png file of the histogram
  png("plot1.png", width = 480, height = 480)
  hist(sample$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)" )
  dev.off()
}