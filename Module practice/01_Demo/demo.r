library(tidyverse)
library(jsonlite)

x <- 3

numlist <- c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)

demo_table <- read.csv(file='demo.csv',check.names=F,stringsAsFactors = F)

demo_table2 <- fromJSON(txt='demo.json')

# Multiple ways to get same data...here are two ways to select the third row of the year column
# R uses an index that starts at 1
demo_table[3,"Year"]
demo_table[3,3]

#OR you can use By using the $ operator, we can select columns from any two-dimensional R data structure 
# as a single vector, similar to selecting a series from a Pandas DataFrame

demo_table$"Vehicle_Class"


# Once we have selected the single vector, we can use 
# bracket notation to select a single value.
demo_table$"Vehicle_Class"[2]

# Filter example

filter_table <- demo_table2[demo_table2$price > 10000,]

# More advanced filter table using subset - filter by price and drivetrain

filter_table2 <- subset(demo_table2, price > 10000 & drive == "4wd" & "clean" %in% title_status)


# It would be quite complex using with brackets:

filter_table3 <- demo_table2[("clean" %in% demo_table2$title_status) & (demo_table2$price > 10000) & (demo_table2$drive == "4wd"),]


# sampling - sample 4 of this vector
sample(c("cow", "deer", "pig", "chicken", "duck", "sheep", "dog"), 4)

# sampling a two-dimensional data structure

#1)  Create a numerical vector that is the same length as the number of rows in the data frame using the colon (:) operator.
num_rows <- 1:nrow(demo_table)

#2) Use the sample() function to sample a list of indices from our first vector.
sample_rows <- sample(num_rows, 3)

#3) Use bracket notation to retrieve data frame rows from sample list.
demo_table[sample_rows,]

#1-3) in one line
demo_table[sample(1:nrow(demo_table), 3),]

#Mutate -  if we want to use our coworker vehicle data from the demo_table and 
# add a column for the mileage per year, as well as label all vehicles as active,

demo_table <- demo_table %>% mutate(Mileage_per_Year=Total_Miles/(2020-Year),IsActive=TRUE) #add columns to original data frame

# Summarize -  For example, if we want to group our used car data by the condition of the vehicle 
# and determine the average mileage per condition, we would use the following dplyr statement:

summarize_demo <- demo_table2 %>% group_by(condition) %>% summarize(Mean_Mileage=mean(odometer), .groups = 'keep') #create summary table

# However, the dplyr summarize() documentation provides a more comprehensive list of functions 
#that can be used to summarize our data. For example, if in addition to our previous summary table 
# we wanted to add the maximum price for each condition, as well as add the vehicles in each category, our statement would look as follows:


summarize_demo <- demo_table2 %>% group_by(condition) %>% summarize(Mean_Mileage=mean(odometer),Maximum_Price=max(price),Num_Vehicles=n(), .groups = 'keep') #create summary table with multiple columns

# FYI - The summarize() function takes an additional argument, .groups. This allows you to control the the grouping of the result. The four possible values are:

#.groups = "drop_last" drops the last grouping level (default)
#.groups = "drop" drops all grouping levels and returns a tibble
#.groups = "keep" preserves the grouping of the input
#.groups = "rowwise" turns each row into its own group


























