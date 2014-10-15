link <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(link,"temp.zip")
unzip("temp.zip", "household_power_consumption.txt")
df<- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE, na.strings= "?")

df.subset <- subset(df,df$Date=="1/2/2007" | df$Date=="2/2/2007")

df.subset$dateTime <- strptime(paste(df.subset$Date, df.subset$Time), "%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2), mar = c(4,4,2,1))
plot(df.subset$dateTime, df.subset$Global_active_power, type="n", ylab="Global Average Power", xlab="")
lines(df.subset$dateTime, df.subset$Global_active_power)
plot(df.subset$dateTime, df.subset$Voltage, type="n", ylab="Voltage", xlab="dateTime")
lines(df.subset$dateTime, df.subset$Voltage)
plot(df.subset$dateTime, df.subset$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
lines(df.subset$dateTime, df.subset$Sub_metering_1, col="black")
lines(df.subset$dateTime, df.subset$Sub_metering_2, col="red")
lines(df.subset$dateTime, df.subset$Sub_metering_3, col="blue")
legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red","blue"), lwd=1, lty=c(1,1,1), bty='n', merge=FALSE, xjust=2, yjust=0)
plot(df.subset$dateTime, df.subset$Global_reactive_power, type="n", ylab="Global_reactive_power", xlab="datetime")
lines(df.subset$dateTime, df.subset$Global_reactive_power)
dev.off()
