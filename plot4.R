library(tidyr)
library(dplyr)
library(datasets)

data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses="character")
#"sep" is a very important argument

data_tbl_df<-tbl_df(data)
rm(data)
plot<-filter(data_tbl_df,Date=="1/2/2007" | Date=="2/2/2007")
#subset  a new file  

plot$date_time<-strptime(paste(plot$Date,plot$Time),
                         "%d/%m/%Y %H:%M:%S")
#add a new variable that contain date and time ,"paste" play as a key role 
#"mutate()" function doesn't work when deal with "POSIXct"
#date format(1/2/2007) must use "%d/%m/%Y %H:%M:%S",using "%d/%m/%y %H:%M:%S" return NA.



png(file="plot4.png")

par(mfrow=c(2,2))

#panel1
plot(plot$date_time,plot$Global_active_power,
               type="l",
               xlab=" ",
               ylab="Global Active Power"  
     )

#panel2
plot(plot$date_time,plot$Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage"  
     )

#panel3
with(plot,plot(plot$date_time,plot$Sub_metering_1,
               type="l",
               xlab=" ",
               ylab="Energy sub metering"
)
)

with(plot,lines(plot$date_time,plot$Sub_metering_2,
                type="l",
                col="red"
)
)

with(plot,lines(plot$date_time,plot$Sub_metering_3,
                type="l",
                col="blue"
)
)

legend("topright",pch="-",col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
)

#panel4
plot(plot$date_time,plot$Global_reactive_power,
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power"  
)

dev.off()









