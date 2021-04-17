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


# Box plot #1 - highway fuel efficiency from our mpg data

plt <- ggplot(mpg,aes(y=hwy)) #import dataset into ggplot2
plt + geom_boxplot() #add boxplot


#Box plot #2 - set of box plots comparing highway fuel efficiency for each car manufacturer

plt <- ggplot(mpg,aes(x=manufacturer,y=hwy)) #import dataset into ggplot2
plt + geom_boxplot() + theme(axis.text.x=element_text(angle=45,hjust=1)) #add boxplot and rotate x-axis labels 45 degrees




# Heat map #1 -  average highway fuel efficiency across the type of vehicle class from 1999 to 2008

mpg_summary <- mpg %>% group_by(class,year) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep') #create summary table

plt <- ggplot(mpg_summary, aes(x=class,y=factor(year),fill=Mean_Hwy))

plt + geom_tile() + labs(x="Vehicle Class",y="Vehicle Year",fill="Mean Highway (MPG)") #create heatmap with labels



# Heat map #2 - difference in average highway fuel efficiency across each vehicle model from 1999 to 2008


mpg_summary <- mpg %>% group_by(model,year) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep') #create summary table
plt <- ggplot(mpg_summary, aes(x=model,y=factor(year),fill=Mean_Hwy)) #import dataset into ggplot2
plt + geom_tile() + labs(x="Model",y="Vehicle Year",fill="Mean Highway (MPG)") + #add heatmap with labels 
theme(axis.text.x = element_text(angle=90,hjust=1,vjust=.5)) #rotate x-axis labels 90 degrees



# Adding plot layers

# Example #1 - recreate our previous boxplot example comparing the highway fuel 
# efficiency across manufacturers, add our data points using the geom_point() function:

plt <- ggplot(mpg,aes(x=manufacturer,y=hwy)) #import dataset into ggplot2
plt + geom_boxplot() + #add boxplot
theme(axis.text.x=element_text(angle=45,hjust=1)) + #rotate x-axis labels 45 degrees
geom_point() #overlay scatter plot on top



#Example #2 - what if we want to compare average engine size for each vehicle class? In this case, we would supply our new data 
#and variables directly to our new geom function using the optional mapping and data arguments.The mapping argument functions exactly 
#the same as our ggplot() function, where our mapping argument uses the aes() function to identify the variables to use. Additionally, 
#the data argument can be used to provide a new input data structure; otherwise, the mapping function will reference the data structure provided in the ggplot object.

mpg_summary <- mpg %>% group_by(class) %>% summarize(Mean_Engine=mean(displ), .groups = 'keep') #create summary table
plt <- ggplot(mpg_summary,aes(x=class,y=Mean_Engine)) #import dataset into ggplot2
plt + geom_point(size=4) + labs(x="Vehicle Class",y="Mean Engine Size") #add scatter plot


#Example 2.1 - We need to provide context around the standard deviation of the engine size for each vehicle class. If we compute the standard deviations in our dplyr summarize() 
#function, we can layer the upper and lower standard deviation boundaries to our visualization using the geom_errorbar() function:

mpg_summary <- mpg %>% group_by(class) %>% summarize(Mean_Engine=mean(displ),SD_Engine=sd(displ), .groups = 'keep')
plt <- ggplot(mpg_summary,aes(x=class,y=Mean_Engine)) #import dataset into ggplot2
plt + geom_point(size=4) + labs(x="Vehicle Class",y="Mean Engine Size") + #add scatter plot with labels
  geom_errorbar(aes(ymin=Mean_Engine-SD_Engine,ymax=Mean_Engine+SD_Engine)) #overlay with error bars


# Faceting

# We want to plot all our measurements but keep each level (or category) of our grouping variable separate. This process of separating out plots for each level is known as faceting in ggplot2.
#Faceting is performed by adding a facet() function to the end of our plotting statement. Consider, if instead of the wide format, our mpg dataset was obtained where city and highway fuel efficiency data was provided in a long format:

mpg_long <- mpg %>% gather(key="MPG_Type",value="Rating",c(cty,hwy)) #convert to long format
head(mpg_long)

# Faceting plot example #1

plt <- ggplot(mpg_long,aes(x=manufacturer,y=Rating,color=MPG_Type)) #import dataset into ggplot2
plt + geom_boxplot() + theme(axis.text.x=element_text(angle=45,hjust=1)) #add boxplot with labels rotated 45 degrees


# Faceting plot example #2 - adding facet_wrap()

plt <- ggplot(mpg_long,aes(x=manufacturer,y=Rating,color=MPG_Type)) #import dataset into ggplot2
plt + geom_boxplot() + facet_wrap(vars(MPG_Type)) + #create multiple boxplots, one for each MPG type
  theme(axis.text.x=element_text(angle=45,hjust=1),legend.position = "none") + xlab("Manufacturer") #rotate x-axis labels


