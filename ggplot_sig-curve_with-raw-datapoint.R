rm(list=ls())

library(ggplot2)

current_path <- #"directory of where the data is stored" 
setwd(current_path)

files <- list.files(pattern="search key") #replaced by the search word in the file's name
rf1 <- read.csv(files, header=TRUE, sep=",")


#to create a subset of the data using 'subset' function (logical test is specified in the second part of function)
subsetted_data <- subset(rf1, category=="motivation" & participant_re!="b012", select=participant:session)


##To compute SD of the rating across paricipant
ctrd_rate <- subsetted_data$centred_rate
sdrate <- sd(ctrd_rate, na.rm=TRUE)
##sdrate: 1.8597

#estimated parameters taken from the glmer modelling analysis
intercept <- 0.06925  
beta_prob <- 1.25210
beta_rate <- 0.73798

#data simulating
x <- seq(-5,5,length.out=100)
##the y-cooridinate is computed/simulated with the estimated parameters
y_mean <- 1/(1+exp(-1*(intercept - beta_prob*x)))

yplus1sd <- 1/(1+exp(-1*(intercept - beta_prob*x + beta_rate*sdrate)))
ymin1sd <- 1/(1+exp(-1*(intercept - beta_prob*x - beta_rate*rate)))

#create a data.frame as ggplot require drawing variables from a data frame/dateset
df1 <- data.frame(x_var=x, y_mean=y_mean, yplus1sd=yplus1sd, ymin1sd=ymin1sd)


#plotting a basic curve
sp<- ggplot(data=df1, aes(x=x_var)) + geom_line(aes(y=y_mean), size=1, colour='red', linetype="dotted") + 
  geom_line(aes(y=yplus1sd), size=1, colour='blue') + 
  geom_line(aes(y=ymin1sd), size=1, colour='green')

#elements in title, axis.text are edited here
title.align <- element_text(hjust = 0.5)
axis.title.bold <- element_text(face="bold", size="10")
axis.text.bold <- element_text(face="bold", size="9")

#adding more elements to the curve
sp1 <- sp + scale_x_continuous(name="probability of shock", breaks=c(-4,-2,0,2,4), labels=c("-4"="16.7%", "-2"="33.3%", "0"="50%", "2"="66.7%", "4"="83.3%")) + 
  scale_y_continuous(name="Acceptance Rate", breaks=c(0, 0.5, 1)) +
  ggtitle("Motivation Condition") +
  theme(plot.title = title.align, axis.title=axis.title.bold, axis.text =axis.text.bold) 




#I want to plot the average acceptance rate (choice) for each given probability of shock (percentage) per participant
selectcols <- data.frame(subsetted_data$participant, subsetted_data$centred_prob, subsettd_data$choice) 
names(selectcols)[c(1,2,3)] <- c("participant_re","percentage","re_choice")

##this 'aggregate' function allows you to organise data in which the average(mean) of acceptance rate (choice) for each given probabilty per participant is computed
abc<- aggregate(.~participant_re+percentage, data=selectcols, FUN=function(x) avg_choice=mean(x))

#curve plotting incorporating each participant's average acceptance rate (choice) or other raw scores as you prefer
sp1 + geom_point(data = abc, mapping = aes(x = percentage, y = avg_choice), shape=1, position=position_jitter(h=0.02,w=0))



