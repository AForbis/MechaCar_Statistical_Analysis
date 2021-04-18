# MechaCar_Statistical_Analysis

## Linear Regression to Predict MPG

![](Images/SummaryStats_Del%231.png)

  - The following variables/coefficients provided a non-random amount of variance to the mpg values in the dataset: (a) ground_clearance, (b) vehicle_length, and (c) the intercept (which indicates there are other variables and factors that contribute to the variation in mpg that have not been included in our model.
  - The slope of the linear model is not zero. According to our model, multiple variables (ground_clearance, vehicle_length, intercept) were statistically unlikely to provide random amounts of variance to the model). 
  - This linear model predicts mpg of MechaCar prototypes fairly effectively. In this case, r-squared = .71, indicating that roughly 71% of mpg predictions will be correct when using this model. 


## Summary Statistics on Suspension Coils

![](Images/totalSummary_Del%232.png)

![](Images/LotSummary_Del%232.png)

  - The current manufacturing data meets the suspension coil design specification (variance of coils may not exceed 100lbs/square inch) for all manufacturing lots in total but NOT each lot individually. The variance across all lots (62), Lot1 (1), and Lot2 (7) meet the design specification, while the variance for Lot3 (170) did not meet the design specification.

## T-Tests on Suspension Coils

![](Images/SampleVSpop_Del%233.png)

![](Images/LotsVSpop_Del%233.png)

  - The mean PSI across all manufacturing lots (1,498.78) was not statistically different at the .05 significance level from the population mean of 1,500 pounds per square inch.

  - Only the mean PSI for manufacturing Lot3 (1,496.14) was statistically different from the population mean of 1,500 pounds per square inch at the .05 significance level. Lot1 and Lot2 were not statistically significant from the population mean.

## Study Design: MechaCar vs Competition


