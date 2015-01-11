##plot1.R

#get the current time settings
lct <- Sys.getlocale("LC_TIME")

#changes time settings to English
Sys.setlocale("LC_TIME", "English")

df<-read.table("household_power_consumption.txt",sep=";",header=T,na.strings="?",
	colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

#gets only the relevante data
subdf<-df[strptime(df[,1],"%d/%m/%Y")>="2007-02-01" & strptime(df[,1],"%d/%m/%Y")<="2007-02-02",] 
subdf<-subdf[complete.cases(subdf),]


#output to a file
#The default is width = 480, height = 480, units = "px"
png("plot1.png")

#one graphic in one device
par(mfrow=c(1,1))

hist(subdf[,3],col="red", xlab="Global Active Power (kilowatts)",main="Global Active Power")


dev.off()


#changes time settings back to original settings
Sys.setlocale("LC_TIME", lct)