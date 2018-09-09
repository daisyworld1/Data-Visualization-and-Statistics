# `titanic` is a data.frame with four columns: `Survived`, `Pclass`, `Sex`, `Age`. 
# You'll find four `ggplot` plots with increasing complexity levels. 
# Each plot communicates more  information than that of the preceding plot

# 1 - this plot shows the number of male/female in each `Pclass`. 
ggplot(titanic, aes(x = Pclass, fill = Sex)) +
  geom_bar(position = "dodge")

# 2 - this plots added additional layer `facet_grid` which separates the data to display two histograms horizontally based on integer variable `Survived` 
ggplot(titanic, aes(x = Pclass, fill = Sex)) +
  geom_bar(position = "dodge") +facet_grid(. ~ Survived)

# 3 - this plot added another piece of information `Age`, which was set as the y-axis. `position_jetterdodge` function allows
# the plot to illustrate the number of passeger who did or did not survive and their age, sex, and Pclass.

posn.jd <- position_jitterdodge(0.5, 0, 0.6) 

ggplot(titanic, aes(x = Pclass, y = Age, col = Sex)) +
  geom_point(position = posn.jd, size = 3, alpha = 0.5) + facet_grid(. ~ Survived)
