train_user_visual <- read.csv(file="train_user_clean.csv", header=TRUE, sep=";")
 
 #view relationship between age and country_destination
 train_user_visual <- subset(train_user_visual,age < 100 & age > 17)
 ggplot(train_user_visual,aes(x = age, fill= country_destination)) + geom_histogram(binwidth = 1, position = "stack")
 
 #remove US, NDF, and other for better visualization of oversea destination choices
 train_user_overseas <- subset(train_user_visual, country_destination != "US" & country_destination != "NDF" & country_destination != "other" )
 ggplot(train_user_overseas,aes(x = age, fill= country_destination)) + geom_histogram(binwidth = 1, position = "stack")
 ggplot(train_user_overseas,aes(x = age, fill= country_destination)) + geom_histogram(binwidth = 1, position = "fill")
 
 
 
 
