#this script assumes the data is present in a folder named 'exdata_data_household_power_consumption' under the working directory.

#reads the data, subsets based on date
rawdata<-read.table("exdata_data_household_power_consumption\\household_power_consumption.txt", header=TRUE,sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
rawdata$Date<-as.Date(rawdata$Date,"%d/%m/%Y")
smallset<-subset(rawdata,rawdata$Date>=as.Date("2007-02-01","%Y-%m-%d")&rawdata$Date<=as.Date("2007-02-02","%Y-%m-%d"))

#creates histogram and saves it as png
png("plot1.png",width=480,height=480)
hist(smallset$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")
dev.off()
