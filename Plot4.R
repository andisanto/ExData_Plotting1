



data <- read.table( file = "~/Project_1_Plot1/ExData_Plotting1/household_power_consumption.txt"
                    , sep  = ";"
                    , na   = "?"
                    , header = TRUE
)

sum (is.na(data))

# specifying the format
format <- "%d/%m/%Y %H:%M:%S"
#Date and time
data$datetime<-  strptime(paste(data$Date,data$Time) , format = format)

head(data)

data$Date2<- as.Date(data$Date ,format = "%d/%m/%Y")

class(data$Date2)


data2 <- subset(data , Date2 >= as.Date("2007-02-01") & Date2 <= as.Date("2007-02-02") )

dev.off()   



#plot 4
par(mfrow = c(2, 2))
with(data2, {
  
  plot(    x    = datetime
           , y    = Global_active_power
           , type = "l" 
           , xlab = "" 
           , ylab = "Global Active Power (kilowatts)" )
  
  plot(datetime, Voltage , type = "l")
  
  plot(    x    = datetime
           , y    = Sub_metering_1
           , type = "l" 
           , xlab = "" 
           , ylab = "Energy sub metering" 
           , col  = "black"  )
  lines(   x    = datetime
           , y    =Sub_metering_2
           , col  = "red")
  
  lines(   x    = datetime
           , y    = Sub_metering_3
           , col  = "blue")
  
  legend("top"
         , legend = c("Sub_metering_1", "Sub_metering_1", "Sub_metering_1")
         , col = c("black", "red", "blue") 
         , cex=0.5
         , lty = 2
         , bty = "n"
         
          )
  
  plot(datetime, Global_reactive_power , type = "l")
  
  
})

dev.copy(png, file="~/Project_1_Plot1/ExData_Plotting1/figure/Plot4.png", width = 480, height = 480)
dev.off()
