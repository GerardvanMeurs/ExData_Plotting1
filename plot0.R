# plot0.R
# reading, preparing and saving the data
#

# estimating size: #rows *#columns * 8bytes / 2^20 (in megabytes)
# 1 gigabyte = 1000 megabytes
# (2,075,259 * 9 * 8) = 142.5 megabytes; no problem, 8 Gb available

# Url and filename
zipUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipFile <- "household_power_consumption.zip"

# download zip file (wb, binary mode) if it is not already been downloaded
if (!file.exists(zipFile)) {
  download.file(zipUrl, zipFile, mode = "wb")
}

# unzip zip file containing data if text-file does not yet exists
txtFile <- "household_power_consumption.txt"
if (!file.exists(txtFile)) {
  unzip(zipFile)
}

# read in text-file in dataframe
hpc <- read.csv("household_power_consumption.txt", 
                sep = ";",
                na.strings = "?",
                stringsAsFactors = FALSE)

# convert Date & Time to a DateTime class
hpc$dateTime <- strptime(paste(hpc$Date, hpc$Time), format = "%d/%m/%Y %H:%M:%S")
# convert Date to a Date Class
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
# remove original Time column
hpc$Time <- NULL

# select only two day: 2007-02-01 and 2007-02-02
hpc <- subset(hpc, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# check the selection
table(hpc$Date)

# saving the data
saveRDS(hpc, file = "hpc.RDS")