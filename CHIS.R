###Mosaic Plot
#Based on California health care data. Plot shows the frequency distribution within each BMI category.
#table "adult" has individaul information containing attributes such as age ("SRAGE_P") and BMI ("RBMI") category.

#create initial contingency table
DF <- as.data.frame.matrix(table(adult$SRAGE_P, adult$RBMI))

# Create groupSum, xmax and xmin columns
DF$groupSum <- rowSums(DF)
DF$xmax <- cumsum(DF$groupSum)
DF$xmin <- DF$xmax - DF$groupSum

# remove the groupSum column
DF$groupSum <- NULL

# Copy row names to variable X
DF$X <- row.names(DF)

# Melt the dataset keeping three columns "X", "xmin", "xmax". For each unique combination of the three attributes, 
# add a column "FILL" representing the BMI category. This also creates a "value" column showing the number of obervations.

library(reshape2)
DF_melted <- melt(DF, id.vars = c("X", "xmin", "xmax"), variable.name = "FILL")

# dplyr call to calculate ymin and ymax. This sets the postion of each rectangle in the y-axis
library(dplyr)
DF_melted <- DF_melted %>%
  group_by(X) %>%
  mutate(ymax = cumsum(value/sum(value)),
         ymin = ymax - value/sum(value))
         
# Plot rectangles
BMI_fill <- scale_fill_brewer("BMI Category", palette = "Reds")
library(ggthemes)
ggplot(DF_melted, aes(ymin = ymin,ymax = ymax,xmin = xmin,xmax = xmax,fill = FILL)) +geom_rect(colour = "white") +scale_x_continuous(expand = c(0,0)) +
  scale_y_continuous(expand = c(0,0)) + BMI_fill + theme_tufte()
