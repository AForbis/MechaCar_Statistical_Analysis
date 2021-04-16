library(tidyverse)
library(jsonlite)

# Gather - Thankfully, the tidyr library from the tidyverse has the gather() and spread() functions to 
# help reshape our data. The gather() function is used to transform a wide dataset into a long dataset.

demo_table3 <- read.csv('demo2.csv',check.names = F,stringsAsFactors = F)

# To change this dataset to a long format, we would use gather() to reshape this dataset.

long_table <- gather(demo_table3,key="Metric",value="Score",buying_price:popularity)

# Or alternatively

long_table <- demo_table3 %>% gather(key="Metric",value="Score",buying_price:popularity)

# Alternatively, if we have data that was collected or obtained in a long format, we can use tidyr's spread() function 
# to spread out a variable column of multiple measurements into columns for each variable.

wide_table <- long_table %>% spread(key="Metric",value="Score")


#And if we want to check if our newly created wide-format table is exactly the same as our original demo_table3, 
# we can use R's all.equal() function:
# If you ever compare two data frames that you expect to be equal, and the all.equal() function tells you they're not, 
# try sorting the columns of both data frames. You can sort columns using the order() and colnames()functions and bracket notation:

#table <- table[,order(colnames(table))]

# (The comma in the bracket indicates that we're selecting all rows.)

# Plotting data
