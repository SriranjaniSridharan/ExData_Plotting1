data1<-read.csv("D:\\Coursera\\Data Science\\exdata_data_household_power_consumption\\household_power_consumption.txt",header = TRUE, sep=";",na.strings="?")
head(data1)
#convert Date column into date class and store in Date1 column
data1$Date1<-as.Date(data1$Date,format="%d/%m/%Y")
head(data1)
#subset data
data2<-subset(data1,Date1 >= "2007-02-01" & Date1<="2007-02-02")
str(data2)
#Concatenate date and time column and convert into date time class
data2$dt<-paste(data2$Date,data2$Time)
data2$dt <- strptime(data2$dt,format="%d/%m/%Y %H:%M:%S")
head(data2)
#Create 2 rows 2 columns
par(mfrow=c(2,2))
#plot1
plot(data2$dt,data2$Global_active_power,type="l",xlab="",ylab="Global Active Power")
#plot2
plot(data2$dt,data2$Voltage,type="l",xlab="datetime",ylab="Voltage")
#plot3
plot(data2$dt,data2$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
points(data2$dt,data2$Sub_metering_1, type="l")
points(data2$dt,data2$Sub_metering_2, type="l",col="Red")
points(data2$dt,data2$Sub_metering_3, type="l",col="Blue")
#plot4
plot(data2$dt,data2$Global_reactive_power,type="l",xlab="datetime",ylab="Global Reactive Power")
#copy to png
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
