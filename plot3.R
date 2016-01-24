# Required library
library(dplyr)
library(lubridate)

# Reading electric power consumption
epc <- read.table("./household_power_consumption.txt", header = T, sep = ";", 
                  na.strings = "?")
epc <- tbl_df(epc)

# Subset data
epc_sub <- epc %>% 
  filter(dmy(Date) == ymd("2007-02-01") | dmy(Date) == ymd("2007-02-02"))

# Plot
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(epc_sub$Sub_metering_1, type = "l", xaxt = "n",
     ylab = "Energy sub metering", xlab = "")
axis(side = 1, at = c(1, 1441, 2880), labels = c("Thu", "Fri", "Sat"))
lines(epc_sub$Sub_metering_2, col = "red")
lines(epc_sub$Sub_metering_3, col = "blue")
legend("topright", paste0("Sub_metering_", 1:3), lty = c(1, 1, 1), 
       col = c("black", "red", "blue"))
dev.off()

