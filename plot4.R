plot4 <- function(){
        ## Read data from file where seperator = ; and na = ?
        data <- read.table("household_power_consumption.txt",sep=';',header=TRUE,na.strings="?")
        ## Subset data
        sdata<-data[data[,1]=="1/2/2007"|data[,1]=="2/2/2007",]
        #Convert DateTime
        sdata$Date <- as.Date(sdata$Date,"%d/%m/%Y")
        sdata$Time <- strptime(paste(sdata$Date,sdata$Time),"%Y-%m-%d %H:%M:%S")
        #Create png file
        png(file="plot4.png", width=480, height=480)    
        #Set Multiple Base Plots
        par(mfcol = c(2,2))
        #Draw Graph 1
        plot(sdata[,2],sdata[,3],type="n",xlab="",ylab="Global Active Power")
        lines(sdata[,2],sdata[,3])
        
        #Draw Graph 2
        plot(sdata[,2],sdata[,7],type="n",xlab="",ylab="Energy sub metering")
        lines(sdata[,2],sdata[,7],col="Black")
        lines(sdata[,2],sdata[,8],col="Red")
        lines(sdata[,2],sdata[,9],col="Blue")
        legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
               lty=c(1,1,1), col=c("Black","Red","Blue"),bty="n"
               )
        
        #Draw Graph 3
        plot(sdata[,2],sdata[,5],type="n",xlab="datetime",ylab="Voltage")
        lines(sdata[,2],sdata[,5])
        
        #Draw Graph 4
        plot(sdata[,2],sdata[,4],type="n",xlab="datetime",ylab="Global_reactive_power")
        lines(sdata[,2],sdata[,4])
        
        #Close PNG Device
        dev.off()
}
