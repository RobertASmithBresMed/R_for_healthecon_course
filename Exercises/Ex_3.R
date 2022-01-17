#=============#
# Intro to R for Health Economics
# Paul Schneider & Sarah Bates


# EXERCISE 3: is BMI a risk factor for high blood pressure?
# 1. check your environment
ls()

# 2. clear the clutter
rm(list = ls())

# 3. read in the data
dat <- read.csv("./data/df_framingham.csv")

# 4. get an overview of the dataframe using the str functiom

# 5. look at the first few rows using the head function

# 6. how many NAs are there in sysBP?

# 7. remove all rows which contain NAs

# 8. what is the median BMI?

# 9. what is the maximum BMI?

# 10. plot the relationship between BMI and sysBP

# 11. fit a linear regression model to assess the association between
# BMI and sysBP, assign it to an object called fit2,
# and use summary(...) to show results

# 12. add regression line to plot 

# 13. does BMI increase the risk of high BP independent of age and sex?