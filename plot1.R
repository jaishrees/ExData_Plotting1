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




'PLOT1
png is a Graphics File Devices Bitmap formats
png: bitmapped format, good for line drawings or images with solid colors, uses lossless
compression (like the old GIF format), most web browsers can read this format natively, good for
plotting many many many points, does not resize well'

png("./ExData_Plotting1/plot1.png", width = 480, height = 480)
hist(hpcdf$Global_active_power, 
     main = "Global Active Power", 
     ylab = "Frequency", 
     xlab = "Global Active Power (kilowatts)", 
     col = "red", 
     breaks = 13, 
     ylim = c(0, 1200), 
     xlim = c(0, 6), 
     xaxp = c(0, 6, 3))
#dev.copy(png, file = "plot1.png") ## Copy my plot to a PNG file but does not allow specification of pixels

dev.off() 

head(hpcdf)
dim(hpcdf)


$Voltage
table(df)