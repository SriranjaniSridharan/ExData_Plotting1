data1<-read.csv("D:\\Coursera\\Data Science\\exdata_data_household_power_consumption\\household_power_consumption.txt",header = TRUE, sep=";",na.strings="?")
head(data1)
#convert Date column into date class and store in Date1 column
data1$Date1<-as.Date(data1$Date,format="%d/%m/%Y")
head(data1)
#subset data
data2<-subset(data1,Date1 >= "2007-02-01" & Date1<="2007-02-02")
str(data2)
#Histogram for global active power
hist(data2$Global_active_power,main="Global Active Power",col="Red",xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
