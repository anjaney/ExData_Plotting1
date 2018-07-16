## Extract the dataset in a dataframe
input_data <- read.csv("./Data_Science_Homework/datasciencecoursera/ExData_Plotting1/Week1_Assignment/Data_Week1/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
input_data$Date <- as.Date(input_data$Date, format="%d/%m/%Y")

## Extract the data required for the given time range
data <- subset(input_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(input_data)

## Convert the date to appropriate type
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Create the second plot  
plot(data$Global_active_power~data$Datetime, type="l",
    ylab="Global Active Power (kilowatts)", xlab="")
## Store the plot in a file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()