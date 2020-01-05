# libraries:
library(ggplot2)
library(gganimate)

# Make 2 basic states and concatenate them:
a <- data.frame(group=c("A","B","C"), values=c(3,2,4), frame=rep('a',3))
b <- data.frame(group=c("A","B","C"), values=c(5,3,7), frame=rep('b',3))
data <- rbind(a,b)  

# Basic barplot:
ggplot(a, aes(x=group, y=values, fill=group)) + 
  geom_bar(stat='identity')

# Make a ggplot, but add frame=year: one image per year
ggplot(data, aes(x=group, y=values, fill=group)) + 
  geom_bar(stat='identity') +
  theme_bw() +
  # gganimate specific bits:
  transition_states(
    frame,
    transition_length = 2,
    state_length = 1
  ) +
  ease_aes('sine-in-out')