setwd("E:\\Jaishree\\Coursera\\5-ExploratoryDataAnalysis")
getwd()


install.packages("sqldf")
library(sqldf)

dataset_url<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

# download the zip file into the working dir
download.file(dataset_url,"Project1Data\\Project1Data.zip")

# unzip the file into directory project1Data
unzip("Project1Data\\Project1Data.zip", exdir = "Project1Data\\project1Data")

# set a connection to the file 
hpc <- "Project1Data/project1Data/household_power_consumption.txt"

# get a file handle
fi <- file(hpc)

# convert to data format using sqldf
hpcdf <- sqldf("select * from fi where date in ('1/2/2007','2/2/2007')",
               file.format = list(header = TRUE, sep = ";"))


# close the file handle fi
close(fi)





'PLOT4
png is a Graphics File Devices Bitmap formats
png: bitmapped format, good for line drawings or images with solid colors, uses lossless
compression (like the old GIF format), most web browsers can read this format natively, good for
plotting many many many points, does not resize well'

# create a calculated field for date and time in dd/mm/yyyy hh:mm:ss format
hpcdf$DT <- strptime(paste(hpcdf$Date, hpcdf$Time), "%d/%m/%Y %H:%M:%S")

png("./ExData_Plotting1/plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2)) #REMEMBER THIS PLACES THE IMAGES IN NW, NE, SW, SE QUADRANT ORDER

# NW quadrant plot 1
plot(hpcdf$DT, 
     hpcdf$Global_active_power, 
     type = "l", 
     ylab = "Global Active Power", 
     xlab = "")

# NE quadrant plot 2
plot(hpcdf$DT, 
     hpcdf$Voltage, 
     type = "l", 
     ylab = "Voltage", 
     xlab = "datetime")

# SW quadrant plot 3
plot(hpcdf$DT, 
     hpcdf$Sub_metering_1, 
     type = "l", 
     ylab = "Energy sub metering", 
     xlab = "", 
     col = "black")
points(hpcdf$DT, 
       hpcdf$Sub_metering_2, 
       type = "l", 
       xlab = "", 
       ylab = "Sub_metering_2", 
       col = "red")
points(hpcdf$DT, 
       hpcdf$Sub_metering_3, 
       type = "l", 
       xlab = "", 
       ylab = "Sub_metering_3", 
       col = "blue")
legend("topright", 
       lty = 1, 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       bty = "n", )

# SE quadrant plot 4
plot(hpcdf$DT, 
     hpcdf$Global_reactive_power, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Global_reactive_power", 
     ylim = c(0, 0.5))


dev.off() 


head(hpcdf)
dim(hpcdf)


$Voltage
table(df)