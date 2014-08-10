plot3 <- function(){
        ## Read data from file where seperator = ; and na = ?
        data <- read.table("household_power_consumption.txt",sep=';',header=TRUE,na.strings="?")
        ## Subset data
        sdata<-data[data[,1]=="1/2/2007"|data[,1]=="2/2/2007",]
        #Convert DateTime
        sdata$Date <- as.Date(sdata$Date,"%d/%m/%Y")
        sdata$Time <- strptime(paste(sdata$Date,sdata$Time),"%Y-%m-%d %H:%M:%S")
        #Create png file
        png(file="plot3.png", width=480, height=480)        
        #Draw Graph
        plot(sdata[,2],sdata[,7],type="n",xlab="",ylab="Energy sub metering")
        lines(sdata[,2],sdata[,7],col="Black")
        lines(sdata[,2],sdata[,8],col="Red")
        lines(sdata[,2],sdata[,9],col="Blue")
        legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
               lty=c(1,1,1), col=c("Black","Red","Blue")
               )
        #Close PNG Device
        dev.off()
}
