##plot2.R


#get the current time settings
lct <- Sys.getlocale("LC_TIME")

#changes time settings to English
Sys.setlocale("LC_TIME", "English")

df<-read.table("household_power_consumption.txt",sep=";",header=T,na.strings="?",
	colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

#gets only the relevante data
subdf<-df[strptime(df[,1],"%d/%m/%Y")>="2007-02-01" & strptime(df[,1],"%d/%m/%Y")<="2007-02-02",] 
rm(df)			#to free memory
subdf<-subdf[complete.cases(subdf),]



#one graphic in one device
par(mfrow=c(1,1))


plot(strptime(paste(subdf[,1],subdf[,2]),"%d/%m/%Y %H:%M:%S"),subdf[,3],type="l",xlab="",ylab="Global Active Power (kilowatts)")

#output to a file
#The default is width = 480, height = 480, units = "px"
dev.copy(png,file="plot2.png")
dev.off()

#changes time settings back to original settings
Sys.setlocale("LC_TIME", lct) 