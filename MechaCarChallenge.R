# MechaCarChallenge Script

# Deliverable #1 - Linear Regression to Predict MPG

library(tidyverse)

mecha_car_mpg_data <- read.csv('MechaCar_mpg.csv') #import dataset

lm(vehicle_length ~ vehicle_weight + spoiler_angle + ground_clearance + AWD + mpg,data=mecha_car_mpg_data) #generate multiple linear regression model

summary(lm(vehicle_length ~ vehicle_weight + spoiler_angle + ground_clearance + AWD + mpg,data=mecha_car_mpg_data)) #generate summary statistics



#Deliverable #2 - Create visualizations for the Trip Analysis

suspension_coil_table <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F) # import dataset as table

total_summary_table <- suspension_coil_table %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep') #create total summary table

lot_summary <- suspension_coil_table %>%  group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep') #create summary table grouping by lot



# Deliverable #3 - T-tests on Suspension Coils

t.test(log10(suspension_coil_table$Manufacturing_Lot),mu=mean((1500))) #compare sample versus population mean

 # t.test(log10(sample_table$Miles_Driven),mu=mean(log10(population_table$Miles_Driven))) #compare sample versus population means
