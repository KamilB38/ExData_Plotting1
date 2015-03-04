# this code assumes that you already ran plot1.R

# read data to data.frame
data <- read.csv("./courseproject1/household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)

#add date field
data$Date_new <- as.Date(data$Date,"%d/%m/%Y")

# subset on dates
data2 <- data[data$Date_new==as.Date("2007-02-01")|data$Date_new==as.Date("2007-02-02"),]

# add new numeric column
data2$Global_active_power_new <- as.numeric(data2$Global_active_power)


png('plot2.png')
data1 <- cbind((strptime(paste(data2[,1],data2[,2]), format = "%d/%m/%Y %H:%M:%S")),data2)
names(data1)[1] <- "datetime"
plot(data1$datetime,data1$Global_active_power_new, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)", main = "Plot 2",adj=0)
dev.off()






