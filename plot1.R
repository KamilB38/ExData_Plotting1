# create dir else print message
if (!file.exists("./courseproject1")) {dir.create("./courseproject1")} else stop("directory with name 'courseproject' already exists: please rename your existing directory or find/replace 'courseproject' in current script'")

# file url
zipfile <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

# download file
download.file(zipfile,destfile="./courseproject1/exdata-data-household_power_consumption.zip", mode="wb")

# unzip de new file
unzip(zipfile="./courseproject1/exdata-data-household_power_consumption.zip",exdir="./courseproject1")

# read data to data.frame
data <- read.csv("./courseproject1/household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)

#add date field
data$Date <- as.Date(data$Date,"%d/%m/%Y")

# subset on dates
data2 <- data[data$Date==as.Date("2007-02-01")|data$Date==as.Date("2007-02-02"),]

# add new numeric column
data2$Global_active_power_new <- as.numeric(data2$Global_active_power)

png("./courseproject1/plot1.png", width=480, height=480, res=120)
hist(data2$Global_active_power_new,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()


