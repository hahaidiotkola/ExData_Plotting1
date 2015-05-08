  ## This is Exploratory Data Analysis Course Project 1.
  ## The following R script is for plot4.
  ## plot4 is a line plot depicting the global active power and energy sub 
  ##   meterings.

    DatFile <- "household_power_consumption.txt"
    Dat <- read.table(DatFile, header = TRUE, sep = ";", 
                colClasses = c("character", "character", rep("numeric", 7)),
                na = "?")
   
    ## Get a subset of 2 days 
    subDat <- Dat[Dat$Date %in% c("1/2/2007", "2/2/2007"), ]
    
    dateTime <- strptime(paste(subDat$Date, subDat$Time, sep = ""),
                  "%d/%m/%Y %H:%M:%S")
    GlobalActivePower <- as.numeric(subDat$Global_active_power)
    GlobalReactivePower <- as.numeric(subDat$Global_reactive_power)
    Voltage <- as.numeric(subDat$Voltage)
    SubMetering1 <- as.numeric(subDat$Sub_metering_1)
    SubMetering2 <- as.numeric(subDat$Sub_metering_2)
    SubMetering3 <- as.numeric(subDat$Sub_metering_3)

    png("plot4.png", width = 480, height = 480, units = "px", bg = "transparent")
    par(mfrow = c(2,2))
    
    ## Top left
    plot(dateTime, GlobalActivePower, type = "l", xlab = "", 
      ylab = "Global Active Power")
    
    ## Top right
    plot(dateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
    
    ## Bottom left
    plot(dateTime, SubMetering1, type = "l", col = "black", xlab = "", 
      ylab = "Energy sub metering")
    lines(dateTime, SubMetering2, col = "red")
    lines(dateTime, SubMetering3, col = "blue")
    legend("topright", bty = "n", col = c("black", "red", "blue"),
      c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
      lwd = 1)

    ## Bottom right
    plot(dateTime, GlobalReactivePower, type = "l", col = "black",  
      xlab = "datetime", ylab = "Global_reactive_power")

    dev.off()

    

    
    
