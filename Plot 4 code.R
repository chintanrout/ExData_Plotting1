ile_inp<-read.csv2(file="household_power_consumption.txt",sep=";", header = TRUE)
start_pt<-"1/2/2007"
fin_pt<-"2/2/2007"
req_set1<-file_inp[file_inp$Date==start_pt,]
req_set2<-file_inp[file_inp$Date==fin_pt,]
req_set<-rbind(req_set1,req_set2)
req_set$Global_active_power<-as.numeric(req_set$Global_active_power)
req_set$Date<-as.Date(req_set$Date, format ="%d/%m/%Y")
req_set$Sub_metering_1<-as.numeric(req_set$Sub_metering_1)
req_set$Sub_metering_2<-as.numeric(req_set$Sub_metering_2)
req_set$Sub_metering_3<-as.numeric(req_set$Sub_metering_3)
req_set$Voltage<-as.numeric(req_set$Voltage)
req_set$Global_reactive_power<-as.numeric(req_set$Global_reactive_power)
png(file="Plot4.png", width = 480, height =480)
par(mfcol=c(2,2))


#plot4
png(filename="plot4.png",width=480, height=480)
par(mfrow=c(2,2))
plot(x=power$POSIX ,y=power$Global_active_power, type = 'l', xlab='',ylab = 'Global Active Power')
plot(x=power$POSIX ,y=power$Voltage, type = 'l', xlab='datetime',ylab = 'Voltage')
plot(x=power$POSIX,y=power$Sub_metering_1, type='l', col = 'black', ylab = 'Energy sub metering', xlab = '')
lines(x=power$POSIX,y=power$Sub_metering_2, col='red')
lines(x=power$POSIX,y=power$Sub_metering_3, col='blue')
legend('topright', legend = c('Sub_metering_1',"Sub_metering_2","Sub_metering_3"), col = c('black','red','blue'), lty = 1, bty = "n")
plot(x=power$POSIX ,y=power$Global_reactive_power, type = 'l', xlab='datetime',ylab = 'Global_reactive_power')
dev.off()

