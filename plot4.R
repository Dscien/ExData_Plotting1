#this script assumes the data is present in a folder named 'exdata_data_household_power_consumption' under the working directory.


#reads the data, subsets based on date
rawdata<-read.table("exdata_data_household_power_consumption\\household_power_consumption.txt", header=TRUE,sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
rawdata$Time<-strptime(paste(rawdata$Date,rawdata$Time, sep=" "),format="%d/%m/%Y %H:%M:%S")
rawdata$Date<-as.Date(rawdata$Date,"%d/%m/%Y")
smallset<-subset(rawdata,rawdata$Date>=as.Date("2007-02-01","%Y-%m-%d")&rawdata$Date<=as.Date("2007-02-02","%Y-%m-%d"))

#creates line plot and saves it as png
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))
#plot 1
plot(smallset$Time,smallset$Global_active_power,type="l", xlab="", ylab="Global Active Power")

#plot 2
plot(smallset$Time,smallset$Voltage,type="l",xlab="datetime", ylab="Voltage")

#plot 3
plot(smallset$Time,smallset$Sub_metering_1,type="l", xlab="", ylab="Energy sub metering")
lines(smallset$Time,smallset$Sub_metering_2,type="l",col="red")
lines(smallset$Time,smallset$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))

#plot 4
plot(smallset$Time,smallset$Global_reactive_power,type="l",xlab="datetime", ylab="Global_reactive_power")

dev.off()