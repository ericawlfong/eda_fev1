library(tidyverse)

# Where you see `...` below, this is a cue to replace the dots with missing code.

# 2. loading data

fev1<- read_csv("/Users/ericawlfong/Documents/GitHub/eda_fev1/fev1.csv")

fev1$id <- factor(fev1$id)

# 3a. correlation

# for tidyverse users...
summarise(fev1, cor = cor(fev1$age,fev1$FEV1))
# but there are many ways to get this answer

# Answer: <discuss linear model assumption>

# 3b. make a scatter plot

age_fev1_plot <- ggplot(data = fev1, aes(x = fev1$age,
                                         y = fev1$FEV1)) +
  geom_point() + geom_smooth() +
  xlab("Age") + ylab("FEV1")
print(age_fev1_plot)

# Answer: <discuss linear model assumption>

# E3c. outliers
fev1_outliers <- fev1 %>%
  group_by(id) %>%
  summarise(corr = cor(age,FEV1)) %>%
  filter(corr < 0) %>%
  view()

# hint: do groupwise calculation of r and then filter/subset 

## Answer: <why would r < 0?>

# 4a. how many? 1

# count how many times each id appears
counts <- fev1 %>%
  group_by(id) %>%
  summarise(n())  %>%

# hint: dplyr has a function to do this, or you can use data.table, aggregate, 
# or even a loop if you really needed to

# then count how many times each count appears
# could pre-calculate and do a geom_col() but geom_bar() does a count for us
ggplot(data = counts, aes(x = factor())) +  # hint: factor on x variable
    geom_bar() + ...

# 4b. each individual's change over time

# E4c. singletons

# E4d. facet on age

# 5. smooth trend

# E6. statistical model

# E7a. skimr

# E7b. GGally