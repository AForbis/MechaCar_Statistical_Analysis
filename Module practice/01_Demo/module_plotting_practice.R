# Plotting Practice with ggplot2

library(tidyverse)
library(ggplot2)

head(mpg) # view mpg data

# bar plot #1

plt <- ggplot(mpg,aes(x=class)) #import dataset into ggplot2

plt + geom_bar() #plot a bar plot

# bar plot #2 - if we want to compare the number of vehicles from each manufacturer in the dataset,
# we can use dplyr's summarize() function to summarize the data, and ggplot2's geom_col() to visualize the results: 

mpg_summary <- mpg %>% group_by(manufacturer) %>% summarize(Vehicle_Count=n(), .groups = 'keep') #create summary table
plt <- ggplot(mpg_summary,aes(x=manufacturer,y=Vehicle_Count)) #import dataset into ggplot2
plt + geom_col() #plot a bar plot

# Note - Functionally, both geom_bar() and geom_col()create bar plots; however, the two methods assume different inputs. geom_bar() expects one variable and 
# generates frequency data, and geom_col()expects two variables where we provide the size of each category's bar.

# Format plot
plt + geom_col() + xlab("Manufacturing Company") + ylab("Number of Vehicles in Dataset") #plot bar plot with labels

# Add 45 degree labels
plt + geom_col() + xlab("Manufacturing Company") + ylab("Number of Vehicles in Dataset") + #plot a boxplot with labels
theme(axis.text.x=element_text(angle=45,hjust=1)) #rotate the x-axis label 45 degrees


#Building a Line plot

#  For example, if we want to compare the differences in average highway fuel economy (hwy) of Toyota vehicles as 
# a function of the different cylinder sizes (cyl), our R code would look like the following:

mpg_summary <- subset(mpg,manufacturer=="toyota") %>% group_by(cyl) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep') #create summary table
plt <- ggplot(mpg_summary,aes(x=cyl,y=Mean_Hwy)) #import dataset into ggplot2
plt + geom_line() #generate line plot
plt + geom_line() + scale_x_discrete(limits=c(4,6,8)) + scale_y_continuous(breaks = c(15:30)) #add line plot with labels


# Building a scatter plot

# For example, if we want to create a scatter plot to visualize the relationship between the size of 
# each car engine (displ) versus their city fuel efficiency (cty), we would create the following ggplotobject:

plt <- ggplot(mpg,aes(x=displ,y=cty,color=class,shape=drv)) #import dataset into ggplot2
plt + geom_point() + labs(x="Engine Size (L)", y="City Fuel-Efficiency (MPG)", color="Vehicle Class",shape="Type of Drive") #add scatter plot with multiple aesthetics

