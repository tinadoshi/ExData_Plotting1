# Calls necessary packages
library(dplyr)

# Download and unzip source data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "project.zip")
unzip("project.zip")

# Reads data
power_all <- read.csv2("household_power_consumption.txt")

# Converts strings into dates, times, and numeric
power <- power_all %>%
     mutate(Time = strptime(paste(Date, Time, sep = " "), "%d/%m/%Y %H:%M:%S")) %>%
     mutate(Date = as.Date(Date, "%d/%m/%Y")) %>%
     filter(Date=="2007-02-01"|Date=="2007-02-02")

power <- power %>% mutate_if(is.character, as.numeric)

# Plot requested data
plot(power$Time,power$Global_active_power,
     xlab = " ",
     ylab = "Global Active Power (kilowatts)",
     type = "l")

# Export plot to PNG
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()