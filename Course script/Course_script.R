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

# EXERCISE: 
# 1. Create an object foo and set it to be 8
# 2. Create another object bar, and set it to be 7
# 3. Is foo divided by bar greater than 1.14 ?

# SOLUTION

foo <- 8
bar <- 7
foo/bar > 1.14

#====================#
# 1.7 Object Classes ----
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
# 1.8 Operations on different data structures ----
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
## 1.9 Basic object Types ----
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
## 1.10 Subsetting  -----
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

# EXERCISE: 

dat = read.table(text=
                   "height weight first_name sex      bmi
                    1   1.38     31      Alice   F 16.27809
                    2   1.45     35        Bob   M 16.64685
                    3   1.21     28      Harry   M 19.12438
                    4   1.56     40       Jane   F 16.43655")


# 1.Select the 3rd row from the data frame dat

# 2.Select the weight variable from the data frame using your preferred method.
##Info: Remember, there are multiple ways to do this: you can use the $ to index the right column, or use the [ , ] with a number or a “variable_name”.

# 3.Select Alice’s data from the data frame.
##Info: It might be helpful to type in dat and press  . to check which row Alice’s data is in.

# 4.Print dat without it’s first row
##Info: You can select rows 2,3, and 4, but you can also show everything except row 1 - try the latter approach.

# 5.Subset the data frame to show just the data for the females
##Info: Remember, F (=FALSE) and "F" (= F as a character) have different meanings in R.

# 6. Create a vector primes with elements 2,3,5,7, and 11.
##Info: You can combine elements into a vector with the c(element_1, element_2,...) command.

# 7. Print all primes that are larger than or equal to 5 using subsetting.

# 8. Create an ‘animal top speed data frame’: speed_dat. It should have three columns, named animal, speed, flying, and should contain the following information:

#The "lion" can run 80km/h, it’s not flying.
#The "marlin" can swim 129km/h, it’s also not flying.
#Finally, the "eagle" can do 240km/h, and of course it’s flying.

#Info 1: The vector flying should be set to TRUE or FALSE.
#Info 2: Use data.frame(vector_1, vector_2,...) to combine multiple vectors into a data frame.


#=====================#
# 2 DATA ANALYSIS -----
#=====================#

#=====================#
# 2.1 Check your R environment  -----
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
dat <- read.csv("https://raw.githubusercontent.com/bitowaqr/R_for_healthecon_course/main/data/df_framingham.csv")


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
# 1. check your enviroment
ls()

# 2. clear old df 
rm(list = ls())

# 3. read in the data from a website 
# dat <- read.csv("URL")
dat <- read.csv("https://raw.githubusercontent.com/bitowaqr/R_for_healthecon_course/main/data/df_framingham.csv")

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

######


# SOLUTION:

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
# 1 fit a log. regression model with sysBP + sex
fit_log2 = glm(TenYearCHD ~ sysBP+sex, family = binomial(link = "logit"), data = dat)
summary(fit_log2)

# 2 predict the risk of CHD for a range of sysBP for males and females separately
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


# 3 visualise the results in one plot
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
# R Markdown  ----
#====================#

install.packages(rmarkdown)
tinytex::install_tinytex()

#=====================#
# Rmarkdown Exercise 1
#=====================#

# 1. Change the format to html

# 2. Use subsetting to present the results from one country only

# 3. Include the table in the report. See if you can present the columns year, lifeExp, pop and gdpPercap only

# 4. Add a plot with population over time in that country

# 5. Change the code so that the code chunk can't be seen in the report

# 6. Report the change in population between the year 1957 and 2007


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


## EXERCISE: 

# check if row sum to 1

m_P <- matrix(data = NA,
              nrow = 3, 
              ncol = 3,
              dimnames = list(c("H", "S","D"), c("H", "S","D")))

m_P["H", ]  <- c(0.9,0.25,0.05)
m_P["S", ]  <- c(0.3,0.5,0.2)
m_P["D", ]  <- c(0,0,1)

# Using for loop, check if each row sums to 1

# SOLUTION:

for (i in 1:nrow(m_P)) {
  
  row_total <- sum(m_P[i,])
  row_total
  
}

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


#=====================#
# Rmarkdown Exercise 2
#=====================#

# Create an R markdown report using the previous exercise as a template

# 1. Subset the data frame to a single year

# 2. Use a for loop to identify the mean life expectancy for each continent

# The function unique can be used to identify the unique value in a column
continents <- c(unique(df_2007$continent))

for (i in continents){
  
  
}

# 3. Create a custom function that present the mean GDP per capita for a certain continent and year.

f_gdpPercap <- function(continent, year){
  
  
}

# 4. Use this function to print the mean GDP for each continent in year you previously selected

# 5. Add text that identifies the highest life expectancy and highest GDP per capita in the year you selected


# . -------

#=============#
# DAY 3  -----
#=============#

#####################################################################################
## The code was originally created by the below, it's a widely used teaching model ##
## Authors: Eline Krijkamp, Fernando Alarid-Escudero,                              ##
##          Eva Enns, Hawre Jalal, Myriam Hunink and  Petros Pechlivanoglou        ##
## Krijkamp EM, et al. Microsimulation modeling for health decision sciences       ##
## using R: a tutorial. Med. Decis. Making. 2018;.                                 ##
#####################################################################################

# the code has been adapted slightly for the purposes of this course.

rm(list = ls())  # delete everything that is in R's memory

#####################################################################################

Strategies     <- c("No Treatment", "Treatment")     # strategy names 
n_age_init     <- 25                                 # age at baseline
n_age_max      <- 55                                 # maximum age of follow up
n_t            <- n_age_max - n_age_init             # time horizon, number of cycles
d_r            <- 0.035                              # equal discount of costs and QALYs by 3%

v_n  <- c("H", "S1", "S2", "D")               # the 4 states of the model: Healthy (H), Sick (S1), Sicker (S2), Dead (D)
n_states <- length(v_n)                            # number of health states 

# Transition probabilities (per cycle)
p_HD    <- 0.005           # probability to die when healthy
p_HS1   <- 0.15          	 # probability to become sick when healthy
p_S1H   <- 0.5           	 # probability to become healthy when sick
p_S1S2  <- 0.105         	 # probability to become sicker when sick
hr_S1   <- 3             	 # hazard ratio of death in sick vs healthy
hr_S2   <- 10            	 # hazard ratio of death in sicker vs healthy 

# Cost and utility inputs 
c_H     <- 2000            # cost of remaining one cycle in the healthy state
c_S1    <- 4000            # cost of remaining one cycle in the sick state
c_S2    <- 15000           # cost of remaining one cycle in the sicker state
c_Trt   <- 12000           # cost of treatment(per cycle; S1,S2)
c_D     <- 0               # cost of being in the death state
u_H     <- 1               # utility when healthy
u_S1    <- 0.75            # utility when sick
u_S2    <- 0.5             # utility when sicker
u_D     <- 0               # utility when dead
u_Trt   <- 0.95            # utility when being treated (S1)

# rate of death in healthy
r_HD    <- - log(1 - p_HD) 

# rate of death in sick
r_S1D   <- hr_S1 * r_HD 	  
# rate of death in sicker
r_S2D   <- hr_S2 * r_HD  

# probability of death in sick
p_S1D   <- 1 - exp(-r_S1D) 
# probability of death in sicker
p_S2D   <- 1 - exp(-r_S2D) 

# calculate discount weight for each cycle
v_dwe <- v_dwc <- 1 / (1 + d_r) ^ (0:n_t)  # discount weight (equal discounting is assumed for costs and effects)

############################### Markov Model  ###########################

#transition probability matrix for NO treatment
m_P <- matrix(data = NA,
              nrow = n_states, 
              ncol = n_states,
              dimnames = list(v_n, v_n))

m_P

### From Healthy
m_P["H", ]  <- c(1 - (p_HS1 + p_HD), p_HS1, 0, p_HD)

### From Sick
m_P["S1", ]  <- c(p_S1H, 1 - (p_S1H + p_S1S2 + p_S1D), p_S1S2, p_S1D)

### From Sicker
m_P["S2", ]   <- c(0, 0, 1 - p_S2D, p_S2D)

### From Dead
m_P["D", ] <- c(0, 0, 0, 1)

# check rows add up to 1
rowSums(m_P)
m_P

# create empty Markov trace 
m_TR <- matrix(data = NA, 
               nrow = n_t + 1, 
               ncol = n_states, 
               dimnames = list(0:n_t, v_n)) 

head(m_TR)      # The head() function enables you to view the top of a table rather than the full matrix

# initialize Markov trace
m_TR[1, ] <- c(1, 0, 0, 0)    

head(m_TR)  # head shows us the first six rows by default. 

for (t in 1:n_t){ # throughout the number of cycles
  
  # estimate next cycle (t+1) of Markov trace
  m_TR[t + 1, ] <- m_TR[t, ] %*% m_P 
  
}

head(m_TR)  # head shows us the first six rows by default. 

#=====================#
# Exercise 3 
#=====================#


#=====================#
# Markov Modelling with PSA
#=====================#

rm(list = ls())  # delete everything that is in R's memory

# Creating a function that generates data frame values for PSA inputs. 

f_gen_psa <- function(n_sim = 1000, c_Trt = 50){
  
  require(truncnorm)
  
  df_psa <- data.frame(
    
    # Transition probabilities (per cycle)
    
    # prob Healthy -> Sick
    p_HS1   = rbeta(n = n_sim,
                    shape1 =  30,
                    shape2 =  170),
    
    # prob Sick    -> Healthy
    p_S1H   = rbeta(n = n_sim,
                    shape1 =  60,
                    shape2 =  60) ,
    
    # prob Sick    -> Sicker
    p_S1S2  = rbeta(n = n_sim,
                    shape1 =  84,
                    shape2 =  716),       
    
    # prob Healthy -> Dead
    p_HD    = rbeta(n = n_sim,
                    shape1 =  10,
                    shape2 =  1990),
    
    # rate ratio death S1 vs healthy
    hr_S1   = rlnorm(n = n_sim,
                     meanlog =  log(3),
                     sdlog =   0.01),
    
    # rate ratio death S2 vs healthy
    hr_S2   = rlnorm(n = n_sim,
                     meanlog =  log(10),
                     sdlog =  0.02),   
    
    # Cost vectors with length n_sim
    # cost p/cycle in state H
    c_H   = rgamma(n = n_sim, 
                   shape = 100, 
                   scale = 20),
    
    # cost p/cycle in state S1
    c_S1  = rgamma(n = n_sim, 
                   shape = 177.8, 
                   scale = 22.5),
    
    # cost p/cycle in state S2
    c_S2  = rgamma(n = n_sim,
                   shape = 225,
                   scale = 66.7),
    
    # cost p/cycle in state D
    c_D   = 0,
    
    # cost p/cycle of treatment
    c_Trt = c_Trt,
    
    # Utility vectors with length n_sim
    # utility when healthy
    u_H   = rtruncnorm(n = n_sim, 
                       mean = 1, 
                       sd = 0.01, 
                       b = 1),
    
    # utility when sick
    u_S1  = rtruncnorm(n = n_sim, 
                       mean = 0.75, 
                       sd = 0.02, 
                       b = 1),
    
    # utility when sicker
    u_S2  = rtruncnorm(n = n_sim, 
                       mean = 0.50,
                       sd = 0.03, 
                       b = 1),
    # utility when dead
    u_D   = 0,
    
    # utility when being treated
    u_Trt = rtruncnorm(n = n_sim,
                       mean = 0.95,
                       sd = 0.02, 
                       b = 1)  
  )
  
  return(df_psa)
}

# To show how this works, we can now use the function to create a set of 5 PSA inputs

f_gen_psa(n_sim = 5,c_Trt = 50)

### Markov Model as a function

f_MM_sicksicker <- function(params) {
  # run following code with a set of data 
  with(as.list(params), {
    
    # rate of death in healthy
    r_HD    = - log(1 - p_HD) 
    # rate of death in sick
    r_S1D   = hr_S1 * r_HD 	  
    # rate of death in sicker
    r_S2D   = hr_S2 * r_HD  
    # probability of death in sick
    p_S1D   = 1 - exp(-r_S1D) 
    # probability of death in sicker
    p_S2D   = 1 - exp(-r_S2D) 
    # calculate discount weight for each cycle
    v_dwe <- v_dwc <- 1 / (1 + d_r) ^ (0:n_t) 
    
    #transition probability matrix for NO treatment
    m_P <- matrix(0,
                  nrow = n_states, 
                  ncol = n_states,
                  dimnames = list(v_n, v_n))
    # fill in the transition probability array
    
    ### From Healthy
    m_P["H", "H"]  <- 1 - (p_HS1 + p_HD)
    m_P["H", "S1"] <- p_HS1
    m_P["H", "D"]  <- p_HD
    ### From Sick
    m_P["S1", "H"]  <- p_S1H
    m_P["S1", "S1"] <- 1 - (p_S1H + p_S1S2 + p_S1D)
    m_P["S1", "S2"] <- p_S1S2
    m_P["S1", "D"]  <- p_S1D
    ### From Sicker
    m_P["S2", "S2"] <- 1 - p_S2D
    m_P["S2", "D"]  <- p_S2D
    ### From Dead
    m_P["D", "D"] <- 1
    # create empty Markov trace 
    m_TR <- matrix(data = NA, 
                   nrow = n_t + 1, 
                   ncol = n_states, 
                   dimnames = list(0:n_t, v_n))     
    
    # initialize Markov trace
    m_TR[1, ] <- c(1, 0, 0, 0)          
    
    ############ PROCESS #####################
    
    for (t in 1:n_t){ # throughout the number of cycles
      # estimate next cycle (t+1) of Markov trace
      m_TR[t + 1, ] <- m_TR[t, ] %*% m_P           
    }
    
    ########### OUTPUT  ######################
    
    # create vectors of utility and costs for each state
    v_u_trt    <- c(u_H, u_Trt, u_S2, u_D)
    v_u_no_trt <- c(u_H, u_S1, u_S2, u_D)
    v_c_trt    <- c(c_H, c_S1 + c_Trt,
                    c_S2 + c_Trt, c_D)
    
    v_c_no_trt <- c(c_H, c_S1, c_S2, c_D)
    # estimate mean QALYs and costs
    v_E_no_trt <- m_TR %*% v_u_no_trt
    
    v_E_trt    <- m_TR %*% v_u_trt
    
    v_C_no_trt <- m_TR %*% v_c_no_trt
    
    v_C_trt    <- m_TR %*% v_c_trt
    
    ### discount costs and QALYs
    
    te_no_trt <- t(v_E_no_trt) %*% v_dwe  
    te_trt    <- t(v_E_trt) %*% v_dwe
    
    tc_no_trt <- t(v_C_no_trt) %*% v_dwc
    
    tc_trt    <- t(v_C_trt)    %*% v_dwc
    
    results <- c(
      "Cost_NoTrt" = tc_no_trt, 
      "Cost_Trt"   = tc_trt, 
      "QALY_NoTrt" = te_no_trt, 
      "QALY_Trt" = te_trt,
      "ICER" = (tc_trt - tc_no_trt)/
        (te_trt - te_no_trt)
    )
    
    return(results)
  }) # end with function  
} # end f_MM_sicksicker function


############# Running model with PSA #################

# First we define the the age at baseline, maximum age, discount rate, number of cycles and
# the names of the states as before, but this time we also define the n_sim which is the number
# of simulations for the PSA and the cost of treatment.


# age at baseline
n_age_init = 25
# maximum age of follow up
n_age_max  = 110
# discount rate for costs and QALYS 
d_r = 0.035
#  number of cycles
n_t <- n_age_max - n_age_init
# the 4 health states of the model:
v_n <- c("H", "S1", "S2", "D") 
# number of health states 
n_states <- length(v_n) 
# number of simulations
n_sim   = 1000
# cost of treatment
c_Trt   = 50       


# We then create the PSA input using the function we've created 


#-- Create PSA Inputs --#

df_psa <- f_gen_psa(n_sim = n_sim, 
                    c_Trt =  c_Trt)


# We can then run the PSA. We first create a matrix with a row for each simulation and 
# a column for each outcome (cost and QALYs for each treatment and the ICER). 

#--  Run PSA  --#

# Initialize matrix of results outcomes
m_out <- matrix(NaN, 
                nrow = n_sim, 
                ncol = 5,
                dimnames = list(1:n_sim,
                                c("Cost_NoTrt", "Cost_Trt",
                                  "QALY_NoTrt", "QALY_Trt",
                                  "ICER")))

# run model for each row of PSA inputs
for(i in 1:n_sim){
  
  # store results in row of results matrix
  m_out[i,] <- f_MM_sicksicker(df_psa[i, ])
  
} # close model loop

#-- Return results --#

# convert matrix to dataframe (for plots)
df_out <- as.data.frame(m_out) 

# output the dataframe from the function  
head(df_out) 


#=====================#


