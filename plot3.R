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



png(file="plot3.png")

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
#using "lines()" add a new line
with(plot,lines(plot$date_time,plot$Sub_metering_3,
                 type="l",
                 col="blue"
                )
     )

legend("topright",pch="-",col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       )

dev.off()













