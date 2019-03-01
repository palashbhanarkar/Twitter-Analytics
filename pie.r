#Mode(Most occurred value)

x <- Tourism$source
mode0 <- names(which.max(table(x)))
mode0

#Twitter for "device", find source column with attr. freqs.

x <- table(Tourism$source)
x
#Sort manually using Freq tab
View(x)

#convert table x to data frame

as.data.frame.table(x)

#create data frame devices

devices = c("Twitter for Android", "Twitter Web Client", "Twitter for iPhone", "Twitter Web App", "Other")
freq = c(19777,5790,4707,2500, 13767)
dev.df = data.frame(devices,freq)
class(dev.df)
dev.df

View(dev.df)
#plot pie chart
fcolor<- c(19777, 5790, 4707, 2500, 13767)
pie(fcolor, labels=c("Android", "Web Client", "iPhone", "Web App", "Other"))
#rainbow
pie(fcolor, group_by(devices), labels=c("Android", "Web Client", "iPhone", "Web App", "Other"), main="Devices used", col=rainbow(length(fcolor)))

###PLOT 2 WITH %

library(ggplot2)
library(dplyr)

df2<-data.frame(Devices = c("Twitter for Android", "Twitter Web Client", "Twitter for iPhone", "Twitter Web App", "Other"),
freq = c(19777,5790,4707,2500, 13767))


df2 %>%
    group_by(Devices) %>%
    summarise(volume = sum(freq)) %>%
    mutate(share=volume/sum(volume)) %>%
    ungroup() %>% 
    arrange(desc(volume)) %>%
    mutate(Devices=factor(Devices, levels = as.character(Devices))) %>% 
    ggplot(aes(x="", y= share, fill=Devices)) +
    geom_col() +
    geom_text(aes(label = scales::percent(round(share,3))), position = position_stack(vjust = 0.5)) +
    ggtitle("                                       DEVICES USED") +
    coord_polar(theta = "y") + 
    theme_void()
