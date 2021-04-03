temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
power <- read.table(unz(temp,"household_power_consumption.txt"), 
                    sep=";", 
                    header = T, 
                    na="?", 
                    colClasses = c("character",
                                   'character',
                                   'numeric',
                                   'numeric',
                                   'numeric',
                                   'numeric',
                                   'numeric',
                                   'numeric',
                                   'numeric'))

unlink(temp)
power <- power[which(power$Date == '2/2/2007' | power$Date=='1/2/2007'),]

req_set$Date<-as.Date(req_set$Date, format ="%d/%m/%Y")                           
par(mfrow=c(1,1)) 

#plot.1
png(file="Plot1.png", height = 480, width = 480)                                  
hist(as.numeric(req_set$Global_active_power),col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()  

