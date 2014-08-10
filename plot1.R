plot1 <- function(){
        ## Read data from file where seperator = ; and na = ?
        data <- read.table("household_power_consumption.txt",sep=';',header=TRUE,na.strings="?")
        ## Subset data
        sdata<-data[data[,1]=="1/2/2007"|data[,1]=="2/2/2007",]
        #Convert DateTime
        sdata$Date <- as.Date(sdata$Date,"%d/%m/%Y")
        sdata$Time <- strptime(paste(sdata$Date,sdata$Time),"%Y-%m-%d %H:%M:%S")
        #Create PNG File
        png(file="plot1.png", width=480, height=480)
        #Draw Graph
        hist(sdata[,3],main="Global Active Power",xlab="Global Active Power (kilowatts)",col="Red")
        #Close PNG Device
        dev.off()
}