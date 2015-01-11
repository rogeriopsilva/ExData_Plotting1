##plot1.R


#get the current time settings
lct <- Sys.getlocale("LC_TIME")

#changes time settings to English
Sys.setlocale("LC_TIME", "English")

library(sqldf)

#gets only the relevante data
subdf<-read.csv.sql("household_power_consumption.txt",sql = "select * from file where Voltage!='?' and Date in ('1/2/2007','2/2/2007')", sep=";",header=T,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

#output to a file
#The default is width = 480, height = 480, units = "px"
png("plot1.png")

#one graphic in one device
par(mfrow=c(1,1))

hist(subdf[,3],col="red", xlab="Global Active Power (kilowatts)",main="Global Active Power")

dev.off()


#changes time settings back to original settings
Sys.setlocale("LC_TIME", lct)