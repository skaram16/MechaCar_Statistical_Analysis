> setwd("~/Desktop/Homework/Mod_15R")
> setwd("~/Desktop/Homework/Mod_15R/MechaCar_Statistical_Analysis")
> # load dplyr package
> library(dplyr)
> 
> #create data frame
> mechaCar_mpg <- read.csv('MechaCar_mpg.csv', stringsAsFactors = F)
> 
> # create linear model
> lin_model <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, mechaCar_mpg)
> 
> #generate summary statistics
> summary(lin_model)

Call:
lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
    ground_clearance + AWD, data = mechaCar_mpg)

Residuals:
     Min       1Q   Median       3Q 
-19.4701  -4.4994  -0.0692   5.4433 
     Max 
 18.5849 

Coefficients:
                   Estimate Std. Error
(Intercept)      -1.040e+02  1.585e+01
vehicle_length    6.267e+00  6.553e-01
vehicle_weight    1.245e-03  6.890e-04
spoiler_angle     6.877e-02  6.653e-02
ground_clearance  3.546e+00  5.412e-01
AWD              -3.411e+00  2.535e+00
                 t value Pr(>|t|)    
(Intercept)       -6.559 5.08e-08 ***
vehicle_length     9.563 2.60e-12 ***
vehicle_weight     1.807   0.0776 .  
spoiler_angle      1.034   0.3069    
ground_clearance   6.551 5.21e-08 ***
AWD               -1.346   0.1852    
---
Signif. codes:  
  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’
  0.1 ‘ ’ 1

Residual standard error: 8.774 on 44 degrees of freedom
Multiple R-squared:  0.7149,	Adjusted R-squared:  0.6825 
F-statistic: 22.07 on 5 and 44 DF,  p-value: 5.35e-11

> # create a dataFrame
> suspension_coil <- read.csv('Suspension_Coil.csv', stringsAsFactors = F)
> 
> # create a summary dataFrame
> total_summary <- suspension_coil %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')
> 
> View(total_summary)
> View(suspension_coil)
> View(mechaCar_mpg)
> View(lin_model)
> View(total_summary)
> #create summary dataFrame grouped by lot
> lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')
> 
> #test if PSI across all lots is statistically different from the population mean
> t.test(suspension_coil$PSI, mu=1500)

	One Sample t-test

data:  suspension_coil$PSI
t = -1.8931, df = 149, p-value =
0.06028
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1497.507 1500.053
sample estimates:
mean of x 
  1498.78 

> 
> #Test if PSI for each lot is statistically different from the mean of the population
> t.test(subset(suspension_coil$PSI, suspension_coil$Manufacturing_Lot=="Lot1"), mu=1500)

	One Sample t-test

data:  subset(suspension_coil$PSI, suspension_coil$Manufacturing_Lot == "Lot1")
t = 0, df = 49, p-value = 1
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1499.719 1500.281
sample estimates:
mean of x 
     1500 

> t.test(subset(suspension_coil$PSI, suspension_coil$Manufacturing_Lot=="Lot2"), mu=1500)

	One Sample t-test

data:  subset(suspension_coil$PSI, suspension_coil$Manufacturing_Lot == "Lot2")
t = 0.51745, df = 49, p-value = 0.6072
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1499.423 1500.977
sample estimates:
mean of x 
   1500.2 

> t.test(subset(suspension_coil$PSI, suspension_coil$Manufacturing_Lot=="Lot3"), mu=1500)

	One Sample t-test

data:  subset(suspension_coil$PSI, suspension_coil$Manufacturing_Lot == "Lot3")
t = -2.0916, df = 49, p-value = 0.04168
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1492.431 1499.849
sample estimates:
mean of x 
  1496.14 
