##plot2.R


#get the current time settings
lct <- Sys.getlocale("LC_TIME")

#changes time settings to English
Sys.setlocale("LC_TIME", "English")


library(sqldf)
subdf<-read.csv.sql("household_power_consumption.txt",
	sql = "select * from file where Voltage!='?' and Date in ('1/2/2007','2/2/2007')", 
	sep=";",header=T,
	colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

subdf<-subdf[complete.cases(subdf),]

#output to a file
#The default is width = 480, height = 480, units = "px"
png("plot2.png")

#one graphic in one device
par(mfrow=c(1,1))

plot(strptime(paste(subdf[,1],subdf[,2]),"%d/%m/%Y %H:%M:%S"),subdf[,3],type="l",xlab="",ylab="Global Active Power (kilowatts)")

dev.off()


#changes time settings back to original settings
Sys.setlocale("LC_TIME", lct)