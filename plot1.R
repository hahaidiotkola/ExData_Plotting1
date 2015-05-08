  ## This is Exploratory Data Analysis Course Project 1.
  ## The following R script is for plot1.
  ## plot1 is a histrogram depicting the household global minute-averaged 
  ##   active power in kilowatt.

    DatFile <- "household_power_consumption.txt"
    Dat <- read.table(DatFile, header = TRUE, sep = ";",
             stringsAsFactors = FALSE, dec = ".", na = "?") 
         
    ## Get a subset of 2 days 
    subDat <- Dat[Dat$Date %in% c("1/2/2007", "2/2/2007"), ]

    GlobalActivePower <- as.numeric(subSetData$Global_active_power)
    png(filename = "plot1.png", width = 480, height = 480, units = "px",
      bg = "transparent")
    hist(GlobalActivePower, col = "red", main = "Global Active Power",
      xlab = "Global Active Power (kilowatts)", breaks = 12, ylim = c(0, 1200))
    
    dev.off() 