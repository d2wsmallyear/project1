library(tidyr)
library(dplyr)
library(datasets)

data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses="character")
#"sep" is a very important argument

data_tbl_df<-tbl_df(data)
rm(data)
plot<-filter(data_tbl_df,Date=="1/2/2007" | Date=="2/2/2007")
#subset  a new file  

plot$Global_active_power<-as.numeric(plot$Global_active_power)
#trans "char" to "num"

png(file="plot1.png")
with(plot,hist(plot$Global_active_power,xlab="Global Active Power(kilowatts)",
                   main="Global Active Power",
                   col="red"
               )
    )
dev.off()










