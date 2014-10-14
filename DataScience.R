link <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(link,"temp.zip")
unzip("temp.zip", "household_power_consumption.txt")
df<- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE, na.strings= "?")
df$date <- paste(df$Date, df$Time)
df$date <- strptime(df$date, "%d/%m/%Y %H:%M:%S")
str(df)
head(df)

