



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

## Draw the plot 1
hist(data2$Global_active_power 
     , xlab = "Global Active Power (kilowatts)" 
     , ylab = "Frequency" 
     , xlim = c(0, 6)
     , ylim = c(0, 1200)
     , breaks=12
     , main = "Global Active Power"
     , col = "Red"
     , xaxt = "n"
     ) 

axis(1 , c(0, 2 ,4 ,6))

dev.copy(png, file="~/Project_1_Plot1/ExData_Plotting1/figure/Plot1.png", width = 480, height = 480)
dev.off()
