# plot4.R
# producing plot4
#

# read selection
hpc <- readRDS("hpc.RDS")

# producing multiple plots with par(), plot(), lines and legend():
par(mfrow = c(2, 2))
# plot (1,1)
with(hpc, plot(dateTime, Global_active_power, type = "l", ylab = "Global Active Power", xlab = ""))
# plot (1,2)
with(hpc, plot(dateTime, Voltage, type = "l"))
# plot (2,1)
with(hpc, plot(dateTime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
with(hpc, lines(dateTime, Sub_metering_2, col = "Red"))
with(hpc, lines(dateTime, Sub_metering_3, col = "Blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# plot (2,2)
with(hpc, plot(dateTime, Global_reactive_power, type = "l"))

# save plot as png-file
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
