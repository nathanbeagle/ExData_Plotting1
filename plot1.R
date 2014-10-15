link <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(link,"temp.zip")
unzip("temp.zip", "household_power_consumption.txt")
df<- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE, na.strings= "?")

df.subset <- subset(df,df$Date=="1/2/2007" | df$Date=="2/2/2007")

df.subset$dateTime <- strptime(paste(df.subset$Date, df.subset$Time), "%d/%m/%Y %H:%M:%S")

png("plot1.png", width=480, height=480, units="px")
hist(df.subset$Global_active_power, breaks=12, col="red", xlab = "Global Active Power (kilowatts)", main="Global Active Power")
dev.off()