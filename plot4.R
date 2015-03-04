# this code assumes that you already ran plot1.R

# read data to data.frame
data <- read.csv("./courseproject1/household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)

#add date field
data$Date_new <- as.Date(data$Date,"%d/%m/%Y")

# subset on dates
data2 <- data[data$Date_new==as.Date("2007-02-01")|data$Date_new==as.Date("2007-02-02"),]

# add new columns
data2$Global_active_power_new <- as.numeric(data2$Global_active_power)
data2$Global_reactive_power_new <- as.numeric(data2$Global_reactive_power)
data2$Voltage_new <- as.numeric(data2$Voltage)
data2$datetime <-(strptime(paste(data2[,1],data2[,2]), format = "%d/%m/%Y %H:%M:%S"))


png('plot4.png')
# create 2 by 2 "matrix"
par(mfrow = c(2,2))
#,  mar = c(3,5,1,1))
#Top left graph
plot(data2$datetime,data2$Global_active_power_new, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)")

#Top right graph
plot(data2$datetime,data2$Voltage_new, type = "l", xlab = "datetime", ylab = "Voltage")

#Bottomleft graph
plot(data2$datetime,data1$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data2$datetime,data1$Sub_metering_2, type = "l", col = "red")
lines(data2$datetime,data1$Sub_metering_3, type = "l", col = "blue")
legend_items <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend("topright", legend_items, col = c("black","red","blue"),lwd=1)

#Bottom right graph
plot(data2$datetime,data2$Global_reactive_power_new, type = "l",xlab = "datetime", ylab = "global_reactive_power")

#Title
mtext("Plot 4", side = 3, line = -2, outer = TRUE,adj=0)
dev.off()






