



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


#plot 2

plot(  x    = data2$datetime
       , y    = data2$Global_active_power
       , type = "l" 
       , xlab = "" 
       , ylab = "Global Active Power (kilowatts)" 
       
)
dev.copy(png, file="~/Project_1_Plot1/ExData_Plotting1/figure/Plot2.png", width = 480, height = 480)

dev.off()

