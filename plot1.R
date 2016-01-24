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
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(epc_sub$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
dev.off()


