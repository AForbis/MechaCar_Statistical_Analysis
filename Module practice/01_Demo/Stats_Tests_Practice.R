# Identifying Statistical Types

library(ggplot2)
library(tidyverse)

# visually assess the distribution of vehicle weights from the built-in mtcars dataset with the geom_density() function:
ggplot(mtcars,aes(x=wt)) + geom_density() #visualize distribution using density plot

# A more quantitative method to test for normality is the shapiro.test() function. 
# The shapiro.test() function only requires the numeric vector of values you wish to test

shapiro.test(mtcars$wt)

# In this case, the p-value is greater than 0.05, so the data is considered normally distributed.



# visualize the distribution of driven miles for our entire population dataset, we can use the geom_density()function from ggplot2:
population_table <- read.csv('used_car_data.csv',check.names = F,stringsAsFactors = F) #import used car dataset
plt <- ggplot(population_table,aes(x=log10(Miles_Driven))) #import dataset into ggplot2
plt + geom_density() #visualize distribution using density plot


# Create a sample dataset using the sample_n() function:

sample_table <- population_table %>% sample_n(50) #randomly sample 50 data points
plt <- ggplot(sample_table,aes(x=log10(Miles_Driven))) #import dataset into ggplot2
plt + geom_density() #visualize distribution using density plot

# One sample t-test -  test if the miles driven from our previous sample dataset is statistically different from the miles driven in our population data,


t.test(log10(sample_table$Miles_Driven),mu=mean(log10(population_table$Miles_Driven))) #compare sample versus population means

# Results of one sample t-test - Assuming our significance level was the common 0.05 percent, our p-value is above our significance level. 
# Therefore, we do not have sufficient evidence to reject the null hypothesis, and we would state that the two means are statistically similar.
