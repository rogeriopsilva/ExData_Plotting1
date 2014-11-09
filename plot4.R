##polt4.R

#get the current time settings
lct <- Sys.getlocale("LC_TIME")

#changes time settings to English
Sys.setlocale("LC_TIME", "English")


df<-read.table("household_power_consumption.txt",sep=";",header=T,na.strings="?",
	colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

#gets only the relevante data
subdf<-df[strptime(df[,1],"%d/%m/%Y")>="2007-02-01 GMT" & strptime(df[,1],"%d/%m/%Y")<="2007-02-02 GMT",] 
rm(df)			#to free memory
subdf<-subdf[complete.cases(subdf),]

#four graphics in one device
par(mfrow=c(2,2))
png("plot4.png")
#Output to a file
#The default is width = 480, height = 480, units = "px"

#plots the graphics
with(subdf,{
	plot(strptime(paste(subdf[,1],subdf[,2]),"%d/%m/%Y %H:%M:%S"),subdf[,3],type="l",xlab="",ylab="Global Active Power (kilowatts)")
	plot(strptime(paste(subdf[,1],subdf[,2]),"%d/%m/%Y %H:%M:%S"),subdf[,5],type="l",xlab="datetime",ylab="Voltage")
	plot(strptime(paste(subdf[,1],subdf[,2]),"%d/%m/%Y %H:%M:%S"),subdf[,7],type="l",xlab="",ylab="Energy sub-metering",col="gray")
	with(subdf,lines(strptime(paste(subdf[,1],subdf[,2]),"%d/%m/%Y %H:%M:%S"),subdf[,8],col="red"))
	with(subdf,lines(strptime(paste(subdf[,1],subdf[,2]),"%d/%m/%Y %H:%M:%S"),subdf[,9],col="blue"))
	legend("topright",lwd=2,bty="n",col=c("gray","red","blue"),legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
	plot(strptime(paste(subdf[,1],subdf[,2]),"%d/%m/%Y %H:%M:%S"),subdf[,4],type="l",xlab="datetime",ylab="Global_reactive_power")
	})


dev.off()

#changes time settings back to original settings
Sys.setlocale("LC_TIME", lct)