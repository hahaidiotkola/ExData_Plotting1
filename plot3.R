  ## This is Exploratory Data Analysis Course Project 1.
  ## The following R script is for plot3.
  ## plot3 is a line plot depicting the energy sub meterings. 

    DatFile <- "household_power_consumption.txt"
    Dat <- read.table(DatFile, header = TRUE, sep = ";", 
             stringsAsFactors = FALSE, dec = ".", na = "?")                
  
    ## Get a subset of 2 days 
    subDat <- Dat[Dat$Date %in% c("1/2/2007", "2/2/2007"), ]
    
    dateTime <- strptime(paste(subDat$Date, subDat$Time, sep = ""),
                  "%d/%m/%Y %H:%M:%S")
    GlobalActivePower <- as.numeric(subDat$Global_active_power)
    SubMetering1 <- as.numeric(subDat$Sub_metering_1)
    SubMetering2 <- as.numeric(subDat$Sub_metering_2)
    SubMetering3 <- as.numeric(subDat$Sub_metering_3)

    png("plot3.png", width = 480, height = 480, units = "px", bg = "transparent")
    plot(dateTime, SubMetering1, type = "l", col = "black", xlab = "", 
      ylab = "Energy sub metering")
    lines(dateTime, SubMetering2, col = "red")
    lines(dateTime, SubMetering3, col = "blue")
    legend("topright", col = c("black", "red", "blue"),
      c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
      lwd = 1)

    dev.off()
    
                
