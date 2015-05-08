  ## This is Exploratory Data Analysis Course Project 1.
  ## The following R script is for plot2.
  ## plot2 is a line plot depicting the household global minute-averaged 
  ##   active power in kilowatt.

    DatFile <- "household_power_consumption.txt"
    Dat <- read.table(DatFile, header = TRUE, sep = ";", stringsAsFactors = FALSE,
               dec = ".", na = "?")
    ## Get a subset of 2 days 
    subDat <- Dat[Dat$Date %in% c("1/2/2007", "2/2/2007"), ]
    
    dateTime <- strptime(paste(subDat$Date, subDat$Time, sep = ""),
                  "%d/%m/%Y %H:%M:%S")
    GlobalActivePower <- as.numeric(subDat$Global_active_power)
    png("plot2.png", width = 480, height = 480, units = "px", bg = "transparent")
    plot(dateTime, GlobalActivePower, type = "l", xlab = "", 
      ylab = "Global Active Power (kilowatts)")

    dev.off()  