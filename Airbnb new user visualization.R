library(tidyverse)
#read in the data
load('working_data.Rdata')
train <- read_csv2("train_user_clean.csv")
glimpse(train)
colSums(is.na(train))

#subset age lower than 100 and larger than 17
train1 <- train %>% filter(age > 17 & age < 100)
summary(train1$age)
ggplot(train1, aes(x = age, fill= country_destination)) + geom_histogram(binwidth = 1, position = "stack")
ggplot(train, aes(x = country_destination)) + geom_bar()

#subset country international locations only
train2 <- train1 %>% filter(country_destination != "US" & country_destination!= "NDF" & country_destination != "other")

ggplot(train2,aes(x = age, fill= country_destination)) + geom_histogram(binwidth = 1, position = "stack")
ggplot(train2,aes(x = age, fill= country_destination)) + geom_histogram(binwidth = 1, position = "fill")


 
 
 
