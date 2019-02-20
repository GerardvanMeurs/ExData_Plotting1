# plot3.R
# producing plot3
#

# read selection
hpc <- readRDS("hpc.RDS")

# producing xy-plot and adding extra lines with plot(), lines() and legend()
with(hpc, plot(dateTime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
with(hpc, lines(dateTime, Sub_metering_2, col = "Red"))
with(hpc, lines(dateTime, Sub_metering_3, col = "Blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# save plot as png-file
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()