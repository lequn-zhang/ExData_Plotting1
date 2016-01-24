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
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(epc_sub$Global_active_power, type = "l", xaxt = "n",
     ylab = "Global Active Power (kilowatts)", xlab = "")
axis(side = 1, at = c(1, 1441, 2880), labels = c("Thu", "Fri", "Sat"))
dev.off()



