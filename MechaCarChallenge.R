# MechaCarChallenge Script

# Deliverable #1 - Linear Regression to Predict MPG

library(tidyverse)
library(dplyr)


mecha_car_mpg_data <- read.csv('MechaCar_mpg.csv') #import dataset

lm(vehicle_length ~ vehicle_weight + spoiler_angle + ground_clearance + AWD + mpg,data=mecha_car_mpg_data) #generate multiple linear regression model

summary(lm(vehicle_length ~ vehicle_weight + spoiler_angle + ground_clearance + AWD + mpg,data=mecha_car_mpg_data)) #generate summary statistics



#Deliverable #2 - Create visualizations for the Trip Analysis

suspension_coil_table <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F) # import dataset as table

total_summary_table <- suspension_coil_table %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep') #create total summary table

lot_summary <- suspension_coil_table %>%  group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep') #create summary table grouping by lot



# Deliverable #3 - T-tests on Suspension Coils

t.test(suspension_coil_table$PSI, mu=1500) #compare sample versus population mean

coils_Lot1 <- subset(suspension_coil_table, Manufacturing_Lot == "Lot1") #assign Lot1 to table
coils_Lot2 <- subset(suspension_coil_table, Manufacturing_Lot == "Lot2") #assign Lot2 to table
coils_Lot3 <- subset(suspension_coil_table, Manufacturing_Lot == "Lot3") #assign Lot3 to table

t.test(coils_Lot1$PSI, mu=1500) # Lot1 vs. population
t.test(coils_Lot2$PSI, mu=1500) # Lot2 vs. population
t.test(coils_Lot3$PSI, mu=1500) # Lot3 vs. population



       