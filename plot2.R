plot2 <- function(){
        ## Read data from file where seperator = ; and na = ?
        data <- read.table("household_power_consumption.txt",sep=';',header=TRUE,na.strings="?")
        ## Subset data
        sdata<-data[data[,1]=="1/2/2007"|data[,1]=="2/2/2007",]
        #Convert DateTime
        sdata$Date <- as.Date(sdata$Date,"%d/%m/%Y")
        sdata$Time <- strptime(paste(sdata$Date,sdata$Time),"%Y-%m-%d %H:%M:%S")
        #Create PNG File
        png(file="plot2.png", width=480, height=480)
        #Draw Graph
        plot(sdata[,2],sdata[,3],type="n",xlab="",ylab="Global Active Power (kilowatts)")
        lines(sdata[,2],sdata[,3])
        #Close PNG Device
        dev.off()
}
