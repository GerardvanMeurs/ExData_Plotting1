# plot2.R
# producing plot2
#

# read selection
hpc <- readRDS("hpc.RDS")

# producing xy-plot with the plot() function:
with(hpc, plot(dateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

# save plot as png-file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()