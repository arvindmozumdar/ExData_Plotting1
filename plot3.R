#### Make sure to set the Working Directory to the location where you save the dataset
setwd("C:/Users/526899/Documents/Projects/Coursera Data Scientist/Exploratory Data Analysis")

#### Read in dataset
hhpc <- read.table(unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt"), 
                   header=T, quote="\"", sep=";",stringsAsFactors = FALSE)

### Format Date and Time Variables
hhpc$time <- strptime(paste(hhpc$Date,hhpc$Time), format = "%d/%m/%Y %H:%M:%S")
hhpc$Date <- as.Date(hhpc$Date, format = "%d/%m/%Y")
hhpc$weekday = as.factor(weekdays(hhpc$Date))
### Convert numeric variables from character - there will be NAs induced by coercion
hhpc$Global_active_power <- as.numeric(hhpc$Global_active_power)
hhpc$Global_reactive_power <- as.numeric(hhpc$Global_reactive_power)
hhpc$Voltage <- as.numeric(hhpc$Voltage) 
hhpc$Global_intensity <- as.numeric(hhpc$Global_intensity)
hhpc$Sub_metering_1 <- as.numeric(hhpc$Sub_metering_1)
hhpc$Sub_metering_2 <- as.numeric(hhpc$Sub_metering_2)
hhpc$Sub_metering_3 <- as.numeric(hhpc$Sub_metering_3)

### Subset for Feb 1 and 2, 2007
hhpc.sub <- subset(hhpc, Date %in% c(as.Date("2007-02-01") , as.Date("2007-02-02")))

### Plot 3
png(filename = "plot3.png",width = 480, height = 480)
with(hhpc.sub, plot(Sub_metering_1, x = time, type = "l", xlab = "", ylab = "Energy sub metering"))
with(hhpc.sub, lines(Sub_metering_2, x = time, col = "Red"))
with(hhpc.sub, lines(Sub_metering_3, x = time, col = "Blue"))
legend("topright", lty = 1, col = c("Black", "Red", "Blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3") )
dev.off()

