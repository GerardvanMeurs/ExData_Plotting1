# plot1.R
# producing plot1
#

# read selection
hpc <- readRDS("hpc.RDS")

# producing histogram with base-plot hist-function:
with(hpc, hist(Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))

# save plot as png-file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()