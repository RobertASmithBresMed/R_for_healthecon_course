#=============#
# Intro to R for Health Economics
# Paul Schneider & Sarah Bates

# SOLUTION:

# EXERCISE 3: is BMI a risk factor for high blood pressure?
# 1. check your environment
ls()

# 2. clear the clutter
rm(list = ls())

# 3. read in the data
dat <- read.csv("./data/df_framingham.csv")

# 4. get an overview of the dataframe using the str functiom
str(dat)

# 5. look at the first few rows using the head function
head(dat)

# 6. how many NAs are there in sysBP?
sum(is.na(dat$sysBP))

# 7. remove all rows which contain NAs
dat =  dat[complete.cases(dat),]

# 8. what is the median BMI?
median(dat$BMI)

# 9. what is the maximum BMI?
max(dat$BMI)

# 10. plot the relationship between BMI and sysBP
plot(dat$BMI,dat$sysBP)

# 11. fit a linear regression model to assess the association between
# BMI and sysBP, assign it to an object called fit2,
# and use summary(...) to show results
fit2 = lm(sysBP ~ BMI, dat)
summary(fit2)

# 12. add regression line to plot 
abline(fit2, col = "purple", lwd = 2)

# 13. does BMI increase the risk of high BP independent of age and sex?
fit_multi2 = lm(sysBP ~ BMI + age * sex, dat)
summary(fit_multi2)


