



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





#plot 3
plot(    x    = data2$datetime
         , y    = data2$Sub_metering_1
         , type = "l" 
         , xlab = "" 
         , ylab = "Energy sub metering" 
         , col  = "black"  )
lines(   x    = data2$datetime
         , y    = data2$Sub_metering_2
         , col  = "red")

lines(   x    = data2$datetime
         , y    = data2$Sub_metering_3
         , col  = "blue")

legend("topright"                                  
       ,legend = c("Sub_metering_1", "Sub_metering_1", "Sub_metering_1")
       ,col = c("black", "red", "blue")
       ,cex = 0.8 , inset = 0.1 ,bty = "n", 
       ,lty = 1)


head(data2)
dev.copy(png, file="~/Project_1_Plot1/ExData_Plotting1/figure/Plot3.png", width = 480, height = 480)

dev.off()


