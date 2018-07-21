rm(list=ls())

library(lme4)

current_path <- #"directory of where the data is stored" 
setwd(current_path)

files <- list.files(pattern="search key") #replaced by the search word in the file's name
rf1 <- read.csv(files, header=TRUE, sep=",")



#to create a subset of the data using 'subset' function
subsetted_data <- subset(rf1, category=="motivation", select=participant:session)

#defining variables to be tested in glme regression models
Choice <- subsetted_data$mod_choice
ctr_prob <- subsetted_data$centred_probability
ctr_rate <- subsetted_data$centred_rating

#glmer model taking the individual variabilities into account (assuming variables are NOT inter-correlated)
output1 <- glmer(Choice ~ ctr_prob + ctr_rate + (1 | participant) + (-1 + ctr_prob | participant) + (-1 + ctr_rate | participant), data = subsetted_data, family = binomial (link= "logit"))
summary(output1_triv)

#glmer model taking the individual variabilities into account (assuming variables are inter-correlated)
output2 <- glmer(Choice ~ ctr_prob + ctr_rate + (1  + ctr_prob + ctr_rate | participant), data = subsetted_data, family = binomial (link= "logit"))
summary(output1_triv)


#comparing outputs of models 1 & 2
c_output=anova(output1, output2)







