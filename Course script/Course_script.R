#=============#
# Intro to R for Health Economics
# Paul Schneider & Sarah Bates

#==========================#
# DAY 1  ----
#==========================#

rm(list = ls())

#=====================#
# 1 R AS A FANCY CALCULATOR ----
#=====================#

#=====================#
# 1.1 Basic operations ----
#=====================#

# add 1 to 1. 
1 + 1
# divide 12 by 4
12/4
# times 3 by 7
3*7
# 10 to the power 3
10^3
# root isn't a basic operation so we will look at this later.

# order of operations:
5*6+2
5*(6+2)


#=====================#
# 1.2 Objects ----
#=====================#

# create an object x which is 3
x <-  3
# create an object y which is 5
y <-  5
# add x and y
x + y
# overwrite x so it now equals 4.
x <-  4
# add x and y again, now the result is 9, not 7.
x + y
# create another object z which is equal to x + y at this time.
z <- x + y
z


#========================#
# 1.3 Manipulate Objects  ----
#========================#

a <- 10
a
# add one to a. A is now 11.
a <- a + 1 
a 
# create an object called b which is 5 less than a
b <- a - 5
b
# change a to be 5 less than it was originally
a <- a - 5
a-b
# a and b are equal!!


#=====================#
# 1.4 See our Objects  ----
#=====================#

# prints the objects in the environment
ls()


#=====================#
# 1.5 Removing Objects ----
#=====================#

# sometimes we may want to remove an object.
rm(a)
# multiple objects at once
rm(x,y)
# remove all objects
rm(list=ls())


#=====================#
# 1.6 Evaluations   ----
#=====================#

# simple evaluations
# 4 is greater than 2
4 > 2
# 4 is greater than 5
4 > 5
# 4 is equal to 3, note double == for an evaluation
4 == 3
# 4 is not equal to 3, note != is not equal to.
4 != 3
# the character x is equal to the character x.
"dog" == "dog"
"dog" == "cat"
# the output from an evaluation can be stored as an object, x. This object can be subject to operations & manipulations.
b <- 4<2
b


#====================#
# 1.7 Quick practice ----
#====================#

# EXERCISE: quick practice
# 1. Create an object foo and set it to be 8
# 2. Create another object bar, and set it to be 7
# 3. Is foo divided by bar greater than 1.14 ?

foo <- 8
bar <- 7
foo / bar > 1.14


#====================#
# 1.8 Object Classes ----
#====================#

# numeric
height <- c(1.38,1.45,1.21,1.56) # combine is used to create the vector.
height

# numeric
weight <- c(45,42,43,50)
weight
class(weight)

# character
first_name <- c("Alice","Bob","Harry","Jane")
first_name
#first_name + 1 # error

# factor
sex <- factor(x = c("F","M","M","F"))
sex

# logical/boolean
tall <- height > 1.4


#=====================#
# 1.9 Operations on different data structures ----
#=====================#

#Adding:
c(1,2,3) + 1
c(1,2,3) + c(1,2,3)
#multiplication
heightft <- height*3.28
# concatenating
c(height,weight)
# concatenating to string
c(height,weight,first_name)

#=====================#
## 1.10 Basic object Types ----
#=====================#

# data frame- columns are variables, rows are observations.
df <- data.frame(height,weight,first_name,sex)
df
# we can select a single variable within the dataframe using the dollar sign.
df$height
# We can add a new variable easily, in this case based on other variables within the dataframe.
df$bmi <- df$weight / df$height^2 
df

#=====================#
## 1.11 Subsetting  -----
#=====================#

# Our data-frame contains the height, weight, first name and bmi of 4 individuals.
df
#To subset a data frame we can use square brackets i.e df[row,column]
#Selecting a column(s)
df$height
df[,"height"]
df[,1]
df[,1:3]
df[,c(1,3)]
#selecting a row(s)
df[1,]
#We might also want to select observations (rows) based on the characteristics of the data
#E.g. we might want to only look at the data for people who are taller than 1.40m
#create a logical variable called min_height which contains T/F for each individual being over 140cm.
min_height <- df$height >= 1.4
min_height
# Subset the data to include only those observations (rows) for which height > 140cm (using min_height).
df.at_least_140 <- df[min_height,]
df.at_least_140
#People smaller than 1.4m
# Subset the data to include only those who are not above min-height of 140cm.
smaller <- df$height < 1.4
df[smaller,]
df[!min_height,]

#=====================#
# Exercise 1 
#=====================#



# . -------------------------



#=====================#
# 2 DATA ANALYSIS -----
#=====================#

#=====================#
# 2.1 Check your R enviroment  -----
#=====================#

# check
ls()

# clear the clutter
rm(list = ls())

# re-check
ls()


#=====================#
# 2.2 Importing data -----
#=====================#

# csv = comma separated values
## Local file path
dat <- read.csv("./data/df_framingham.csv")

## Downloading files from the internet
dat <- read.csv("https://raw.githubusercontent.com/ScHARR-PHEDS/R4ScHARR/master/data/df_framingham.csv")


#====================#
# 2.3 Get an overview of the data set ----
#====================#
str(dat)

# a common error: NA
mean(dat$sysBP)

# Inspect the first few rows of the data set
head(dat)

# --> NA values spooted!

# na.rm = T 
mean(dat$sysBP, na.rm = T)


#====================#
# 2.4 Missing values  ----
#====================#
dat$sysBP

is.na( dat$sysBP)
sum( is.na( dat$sysBP ) ) 

# remove cases with missing values in sysBP
dat <- dat[!is.na(dat$sysBP), ]

# remove cases with any missing values
# dat <- dat[complete.cases(dat), ]


#====================#
# 2.5 Simple stats ----
#====================#

# average blood pressure
mean(dat$sysBP)
# standard deviation
sd(dat$sysBP)
# median
median(dat$sysBP)
# IQR
IQR(dat$sysBP)
quantile(dat$sysBP, probs = c(0.25, 0.75))

# you can assign function outputs to objects
BP_mean <- mean(dat$sysBP)
BP_sd <- sd(dat$sysBP)

# and use these objects afterwards
BP_mean -  1.96 * BP_sd
BP_mean +  1.96 * BP_sd


# # Tip: do not 'attach' data frames, even if it's convenient !
# attach(dat)
# sysBP


#====================#
# 2.6 Plotting your data: the histogram ----
#====================#

hist(dat$sysBP, breaks = 25)
# add a line indicating the mean
abline(v = BP_mean, col = "blue",lwd = 3)


#====================#
# 2.7 Plotting your data: the scatter plot ----
#====================#
plot(x = dat$age, y = dat$sysBP)

# styling your plot
plot(x = dat$age, y = dat$sysBP, col = "cadetblue")
plot(x = dat$age, y = dat$sysBP, col = "cadetblue", cex = 0.5)
plot(x = dat$age, y = dat$sysBP, col = "cadetblue", cex = 0.5, pch = 19)
plot(
  x = dat$age, 
  y = dat$sysBP, 
  col = "cadetblue", 
  cex = 0.5, 
  pch = 19,
  xlab = "Age",
  ylab = "Systolic BP (mmHG)"
  )


#====================#
# 2.8 Bivariate Linear regression ----
#====================#

# fit a model
fit1 = lm(sysBP ~ age, data = dat)

# show summary results
summary(fit1)

# compute 95% confidence intervalls
confint(fit1)

# We can now add the regression line to the scatter plot
# plot(x = dat$age, y = dat$sysBP)
abline(fit1, col = "orange", lwd = 2)

# extract model coefficients
fit1$coefficients

# Use coefficients to make predictions
fit1$coefficients[1] + 50 * fit1$coefficients[2]

# or use the 'predict' function for this:
# predict(fit1, newdata = data.frame(age=50))


#====================#
# 2.9 Multivariable linear regression ----
#====================#
# Number of males and females in the data set
table(dat$sex)

# Bloodpressure by sex
## using a boxplot 
boxplot(dat$sysBP ~ dat$sex)
# no difference?

mean(dat$sysBP[dat$sex=="female"])
mean(dat$sysBP[dat$sex=="male"])
# indeed it seems, no difference

# multivariate regression
fit_multi = lm(sysBP ~ age + sex, data = dat)
summary(fit_multi)

# regressions seems to confirm this: 
# no difference in blood pressure between males and females?

fit_interaction = lm(sysBP ~ age * sex, data = dat)
summary(fit_interaction)

# illustrate results
fit_interaction = lm(sysBP ~ BMI , data = dat)
summary(fit_interaction)


# EXERCISE: is BMI a risk factor for high blood pressue?
# 1. Create a scatter plot for sysBP ~ BMI
# 2. fit a linear regression and check results
# 3. add the regression line to the scatter plot
# 4. does BMI increase the risk of high BP independant of age and sex?

# SOLUTION:
# 1
plot(dat$BMI,dat$sysBP)
# 2
fit2 = lm(sysBP ~ BMI, dat)
summary(fit2)
# 3
abline(fit2, col = "purple", lwd = 2)
# 4
fit_multi2 = lm(sysBP ~ BMI + age * sex, dat)
summary(fit_multi2)



#====================#
# 2.10 logistic regression ----
#====================#

# people with CHD seem to have a higher sys BP
boxplot(dat$sysBP ~ dat$TenYearCHD)

by(dat$sysBP,dat$TenYearCHD,mean)
# mean(dat$sysBP[dat$TenYearCHD == 1])
# mean(dat$sysBP[dat$TenYearCHD == 0])

# fitting a logistic regression model using the 'glm' function
?glm
fit_log = glm(TenYearCHD ~ sysBP, family = binomial(link = "logit"), data = dat)
summary(fit_log)

# extract coefficients and 95% CI
fit_log$coefficients
confint(fit_log)

# exponentiate (un-log) to get odds ratio
exp(fit_log$coefficients[2])
exp(confint(fit_log)[2,])

# what is the risk of CHD for a person with a sysBP of 180?
predict(fit_log, newdata = data.frame(sysBP = 180)) 
# this does not give us what we want

# we need ti specify: type = "response"
predict(fit_log, newdata = data.frame(sysBP = 180), type = "response")

# visualising the result
# create new data set for predictions
new_sysBP <- data.frame(sysBP = seq(from = min(dat$sysBP), to = max(dat$sysBP), by = 1))
new_sysBP

# use fitted model to predict probabilities of CHD
new_sysBP$CHD_risk = predict(fit_log, new_sysBP, type="response")

# let's use different colors for TenYearCHD yes/no
dot_color = ifelse(dat$TenYearCHD == 1, "orange", "blue")
dot_color

# plot logistic regression curve
# scatter plot
plot(
  x = dat$sysBP, 
  y = dat$TenYearCHD,
  col = dot_color,
  xlab = "Systolic BP (mmHg)",
  ylab = "10 year risk of chronic heart disease"
  )
# add prediction curve
lines(
  x = new_sysBP$sysBP, 
  y = new_sysBP$CHD_risk, 
  lwd=2, lty = 2,
  col = "orange")

# add some grid lines
abline(h = c(0.2, 0.4,0.6,0.8,1), col = "gray", lwd = 0.5)
abline(v = c(100,120,140, 160,180), col = "gray", lwd = 0.5)

# add figure caption
title("Figure 1: association between sys BP and 10 year risk of CHD")


# EXERCISE: practice logistic regression
  # does the relationship between sysBP and risk of CHD 
  # differ by sex?
  # 1. fit a log. regression model with sysBP + sex
  # 2. predict the risk of CHD for a range of sysBP for males and females separately
  # 3. visualise the results in one plot


# SOLUTION
# 1
fit_log2 = glm(TenYearCHD ~ sysBP+sex, family = binomial(link = "logit"), data = dat)
summary(fit_log2)

# 2
new_sysBP_m <- data.frame(
  sysBP = seq(from = min(dat$sysBP), to = max(dat$sysBP), by = 1),
  sex = "male"
  )
new_sysBP_f <- data.frame(
  sysBP = seq(from = min(dat$sysBP), to = max(dat$sysBP), by = 1),
  sex = "female"
)

new_sysBP_m$CHD_risk = predict(fit_log2, new_sysBP_m, type="response")
new_sysBP_f$CHD_risk = predict(fit_log2, new_sysBP_f, type="response")


# 3
dot_color2 = ifelse(dat$sex == "female", "purple", "green")

plot(
  x = dat$sysBP, 
  y = dat$TenYearCHD,
  col = dot_color2,
  xlab = "Systolic BP (mmHg)",
  ylab = "10 year risk of chronic heart disease"
)

# add some grid lines
abline(h = c(0.2, 0.4,0.6,0.8,1), col = "gray", lwd = 0.5)
abline(v = c(100,120,140, 160,180), col = "gray", lwd = 0.5)


# predicted risk females
lines(
  x = new_sysBP_m$sysBP, 
  y = new_sysBP_m$CHD_risk, 
  lwd=2, lty = 2,
  col = "green"
  )

#  predicted risk males
lines(
  x = new_sysBP_f$sysBP, 
  y = new_sysBP_f$CHD_risk, 
  lwd=2, lty = 3,
  col = "purple"
)

# add figure caption
title("Figure 2: association between sys BP and 10 year risk of CHD by sex")

# add legend
legend(x = 100, y = 0.5, c("males","females"), col = c("green","purple"), pch=1)





# 2.11 EXCURSION: ggplot2  ------

# plot(...) is a basic R function
# there are much more fancy ways to visualise your data
# commpnly used packages include plotly, latticem highcharterm, ggplot2

#install.packages(ggplot2)
library(ggplot2)

## a help file exists within the ggplot package.
# help(ggplot2)
## gallery with examples + code
# https://www.r-graph-gallery.com/index.html


# 1 basic scatter plot
ggplot(dat, aes(x = age, y = sysBP)) +
  geom_point()

# 2 minimal theme
ggplot(dat, aes(x = age, y = sysBP)) +
  geom_point() +
  theme_minimal()


# 3 colorise by sex 
ggplot(dat, aes(x = age, y = sysBP, col = sex)) +
  geom_point() +
  theme_minimal()

# 4 place legend on bottom
ggplot(dat, aes(x = age, y = sysBP, col = sex)) +
  geom_point() +
  theme_minimal() +
  theme(legend.position = "bottom")

# 5 change colors
ggplot(dat, aes(x = age, y = sysBP, col = sex)) +
  geom_point() +
  theme_minimal() +
  theme(legend.position = "bottom") +
  scale_color_manual(
    values = c("purple","darkgreen"),
    labels =  c("Female","Male"),
    name = "Sex"
    ) 

# 6 labels + title
ggplot(dat, aes(x = age, y = sysBP, col = sex)) +
  geom_point() +
  theme_minimal() +
  theme(legend.position = "bottom") +
  scale_color_manual(
    values = c("purple","darkgreen"),
    labels =  c("Female","Male"),
    name = "Sex"
  )  +
  xlab("Age")  +
  ylab("Systolic BP (mmHG)") +
  ggtitle(
    label = "Association between age and systolic BP", 
    subtitle = "Data: Framingham study"
    ) 

# 7 add regression line
ggplot(dat, aes(x = age, y = sysBP, col = sex)) +
  geom_point() +
  theme_minimal() +
  theme(legend.position = "bottom") +
  scale_color_manual(
    values = c("purple","darkgreen"),
    labels =  c("Female","Male"),
    name = "Sex"
  )  +
  xlab("Age")  +
  ylab("Systolic BP (mmHG)") +
  ggtitle(
    label = "Association between age and systolic BP", 
    subtitle = "Data: Framingham study"
  ) +
  geom_smooth(method = "lm", se = F)

# 8 facets
ggplot(dat, aes(x = age, y = sysBP, col = sex)) +
  geom_point() +
  theme_minimal() +
  theme(legend.position = "bottom") +
  scale_color_manual(
    values = c("purple","darkgreen"),
    labels =  c("Female","Male"),
    name = "Sex"
  )  +
  xlab("Age")  +
  ylab("Systolic BP (mmHG)") +
  ggtitle(
    label = "Association between age and systolic BP", 
    subtitle = "Data: Framingham study"
  )  +
  geom_smooth(method = "lm", se = F) +
  facet_wrap(~sex, ncol = 2)

# 9 store in object
my_plot = ggplot(dat, aes(x = age, y = sysBP, col = sex)) +
  geom_point() +
  theme_minimal() +
  theme(legend.position = "bottom") +
  scale_color_manual(
    values = c("purple","darkgreen"),
    labels =  c("Female","Male"),
    name = "Sex"
  )  +
  xlab("Age")  +
  ylab("Systolic BP (mmHG)") +
  ggtitle(
    label = "Association between age and systolic BP", 
    subtitle = "Data: Framingham study"
  )  +
  geom_smooth(method = "lm", se = F) +
  facet_wrap(~sex, ncol = 2)


my_plot

# 10 manipulate obj
my_plot <- my_plot + 
  theme(legend.position = "none")
my_plot

# 11 save plot
ggsave(my_plot, filename = "./output/my_plot.png", width = 7, height = 5, bg = "white")
  
# . -------------  





#=============#
# DAY 2 ------
#=============#


#====================#
# For loop ----
#====================#

# For loops can be used to repeat the same action multiple times without lots of 
# lines of code. This is a simple function to print list of numbers
for(i in 1:10) {                                           
  
  print(i)                                               
}

# It's useful to when applying a function to all rows or columns of a dataset

# recreate simple data frame used previously

height <- c(1.38,1.45,1.21,1.56) # combine is used to create the vector.
weight <- c(45,42,43,50)
first_name <- c("Alice","Bob","Harry","Jane")
sex <- factor(x = c("F","M","M","F"))
df <- data.frame(height,weight,first_name,sex)
df$bmi <- df$weight / df$height^2 

# use the for loop to report each persons height
for (i in 1:nrow(df)) {
  
   # print combination of the value in column 3 (first name) with the value in column 1 (height)
   print(paste0(df[i,3], " is ",df[i,1], "m tall"))
             
}

# use the for loop to change the variable name (column)

for(i in 1:ncol(df)) {          
  
  # change the name of each column to var followed by the column number
  colnames(df)[i] <- paste0("Var_", i)              
}

# for loops are useful in modeling because we can can use them to simulate change over time

# We add an age column to df
df$age<- c(16,15,13,18)

# set number of years
n_years = 5

# we can simulate change in bmi and age of number of year
for (i in 1:n_years){
  
  # create 4 random numbers to simulate bmi change
  bmi_change<-rnorm(n = 4,mean = 1,sd = 1)
  
  # Create a data frame named DF with the year with three columns; first name from df,
  # age from df with year added and bmi from df with random change added
  
  assign(paste0("DF", i), data.frame(first_name = df$first_name, age=(df$age+i), bmi=df$bmi + bmi_change))

}

# combine these together using rbind
df_year <- rbind(DF1, DF2, DF3, DF4, DF5)
df_year

#library(ggplot2)

# Plot these on a line graph
ggplot(data=df_year, aes(x=age, y=bmi, group=first_name)) +
  geom_line(aes(linetype=first_name))+
  geom_point(aes(shape=first_name))


#====================#
# Custom functions ----
#====================#


# Creating a custom function can be really useful - reduces lines of code and makes work
# easily reproducible, clearer and more organised

# The structure of a function is:

#  function_name <- function(arg1, arg2, ... ){
#   statements
#    return(object)
# }

# Here's a simple example 

f_simple <- function(x,y,z){
  
  value = x + y - z
  
  return(value)
  
}

# to see the details of the function you can just run the name
f_simple

# to run the function, add the arguement in brackets

f_simple(1,2,3)
f_simple(6,5,12)


# EXERCISE: Try creating a function
  # Create a function that calculates the difference 
  # between the maximum & mean of the three numbers (x, y, z) 
  # and returns a single number.


# Custom functions are useful for PSA inputs for health 
# economic modelling, for example:

f_gen_psa <- function(n_sim = 1000){
  
  # creating a vector with values drawn from the beta 
  # distribution with the two parameters
      param1   = rbeta(n = n_sim,
                    shape1 =  30,
                    shape2 =  170)
      
      return(param1)

}

f_gen_psa(n_sim = 5)

# can expand this to include a greater number of parameters

f_gen_psa <- function(n_sim = 1000){
  
  require(truncnorm)
  
  #expanded to a data frame to contain more than one column 
  df_psa <- data.frame(
   
    param1   = rbeta(n = n_sim,
                    shape1 =  30,
                    shape2 =  170),
    
    # added a column with values drawn from the trucated 
    # normal distribution with the two parameters
    param2   = rtruncnorm(n = n_sim, 
                       mean = 1, 
                       sd = 0.01, 
                       b = 1)
  )
  
  return(df_psa)
}

f_gen_psa(n_sim = 5)

# EXERCISE: Create a probabilistic function
# Çreate a function 'flipCoin' that takes 'n' ar an argument and
# simulates flipping a coin n times 
# AND/OR 
# create a function 'throwDice' that takes 'k' and 'n' as arguments and
# simulates throwing a dice with k sides n times 
# 
# (HINT: consider using the 'sample' function with replace = T)
# ?sample


# SOLUTIONS
flipCoin = function(n){
  res = sample(x = c("heads","tails"), size = n, replace = T)
  return(res)
}

trowDice = function(k, n){
  res = sample(x = 1:k, size = n, replace = T)
  return(res)
}


#====================#
# R Markdown  ----
#====================#

install.packages(rmarkdown)
tinytex::install_tinytex()

# . -------




#=============#
# DAY 3  -----
#=============#

# Matrix multiplication example

rm(list = ls())

library(microbenchmark)   # this is a fancy function for running benchmarking to assess speed of code.
library(ggplot2)

# example matrix multiplication vs non-matrix multiplication
#  5 health states

n_row = 5
n_col = 5

# create matrix
m_A <- matrix(data = runif(n = n_row * n_col),
              nrow = n_row,
              ncol = n_col)

# create vector
v_B <- runif(n = n_col)

# matrix multiplication method
matrix_mult <- function(v, m){
  
  v %*% m   # vector times matrix using matrix multiplication
  
}

# non matrix multiplication method
non_matrix_mult <- function(v, m){
  
  # individually assign variables
  s_1 <- v[1] * m[1,1] +  v[2] * m[2,1] + v[3] * m[3,1] + v[4] * m[4,1] + v[5] * m[5,1]
  s_2 <- v[1] * m[1,2] +  v[2] * m[2,2] + v[3] * m[3,2] + v[4] * m[4,2] + v[5] * m[5,2]
  s_3 <- v[1] * m[1,3] +  v[2] * m[2,3] + v[3] * m[3,3] + v[4] * m[4,3] + v[5] * m[5,3]
  s_4 <- v[1] * m[1,4] +  v[2] * m[2,4] + v[3] * m[3,4] + v[4] * m[4,4] + v[5] * m[5,4]
  s_5 <- v[1] * m[1,5] +  v[2] * m[2,5] + v[3] * m[3,5] + v[4] * m[4,5] + v[5] * m[5,5]
  
  c(s_1, s_2, s_3, s_4, s_5)
  
  
}

# both give same results
matrix_mult(v = v_B,m = m_A) == matrix_mult(v = v_B, m = m_A)

# the time difference is huge
tm <- microbenchmark::microbenchmark(
  
  matrix_mult(v = v_B, m = m_A),
  
  non_matrix_mult(v = v_B, m = m_A)
  
)

# in this case approx 1/400th of the time
tm

# we can see that in this plot... on a log scale.
ggplot2::autoplot(object = tm, log = T)

#=====================#
# Exercise 3 
#=====================#


