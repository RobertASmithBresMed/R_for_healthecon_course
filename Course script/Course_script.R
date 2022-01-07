#=============#
# Intro to R for Health Economics
# Paul Schneider & Sarah Bates
# Day 1 Session 1 
#=============#

rm(list = ls())

#=====================#
# Basic operations ----
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
# Objects ----
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
# Manipulate Objects  ----
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
# See our Objects  ----
#=====================#

# prints the objects in the environment
ls()

#=====================#
# Removing Objects ----
#=====================#


# sometimes we may want to remove an object.
rm(a)
# multiple objects at once
rm(x,y)
# remove all objects
rm(list=ls())

#=====================#
#    Evaluations   ----
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
# Quick practice ----
#====================#

# I Create an object foo and set it to be 8
# II Create another object bar, and set it to be 7
# III Is foo divided by bar greater than 1.14 ?

#====================#
# Object Classes ----
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
# logical
tall <- height > 1.4

#=====================#
# Operations on different data structures

#Adding:
c(1,2,3) + 1
c(1,2,3) + c(1,2,3)
#multiplication
heightft <- height*3.28
# concatenating
c(height,weight)
# concatenating to string
c(height,weight,first_name)


## Basic object Types

# data frame- columns are variables, rows are observations.
df <- data.frame(height,weight,first_name,sex)
df
# we can select a single variable within the dataframe using the dollar sign.
df$height
# We can add a new variable easily, in this case based on other variables within the dataframe.
df$bmi <- df$weight / df$height^2 
df


## Subsetting

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

#=====================#
# Session 2
#=====================#

#=============
# Check your R enviroment  -----
#=============

# check
ls()

# clear the clutter
rm(list = ls())

# re-check
ls()

#=============
# Importing data -----
#=============

# csv = comma separated values
## Local file path
dat <- read.csv("./data/df_framingham.csv")

## Downloading files from the internet
dat <- read.csv("https://raw.githubusercontent.com/ScHARR-PHEDS/R4ScHARR/master/data/df_framingham.csv")


#====================#
# Get an overview of the data set ----
#====================#
str(dat)

# a common error: NA
mean(dat$sysBP)

# Inspect the first few rows of the data set
head(dat)

# --> NA values spooted!

#====================#
# Missing values  ----
#====================#
dat$sysBP

is.na( dat$sysBP)
sum( is.na( dat$sysBP ) ) 

# remove cases with missing values
dat <- dat[!is.na(dat$sysBP), ]
# dat <- dat[complete.cases(dat$sysBP), ]


#====================#
# Simple stats ----
#====================#

# average blood pressure
mean(dat$sysBP)
# standard deviation
sd(dat$sysBP)

# you can assign function outputs to objects
BP_mean <- mean(dat$sysBP)
BP_sd <- sd(dat$sysBP)

# and use these objects afterwards
BP_mean -  1.96 * BP_sd
BP_mean +  1.96 * BP_sd
# 
# quantile(dat$heartRate, probs = c(0.05, 0.95))


#====================#
# Plotting your data: the histogram ----
#====================#

hist(dat$sysBP, breaks = 25)
# add a line indicating the mean
abline(v = BP_mean, col = "blue",lwd = 3)

#====================#
# Plotting your data: the scatter plot ----
#====================#

plot(x = dat$age, y = dat$sysBP)


#====================#
# Linear regression ----
#====================#

# fit a model
fit.1 = lm(sysBP ~ age, data = dat)
# show summary results
summary(fit.1)
# compute 95% confidence intervalls
confint(fit.1)

# We can now add the regression line to the scatter plot
# plot(x = dat$age, y = dat$sysBP)
abline(fit.1, col = "red", lwd = 5)

# extract model coefficients
fit.1$coefficients
# Use coefficients to make predictions
fit.1$coefficients[1] + 50 * fit.1$coefficients[2]
# or use the 'predict' function for this:
# predict(fit.1, newdata = data.frame(age=40))

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
fit.multi = lm(sysBP ~ age + sex, data = dat)
summary(fit.multi)

# regressions seems to confirm this: 
# no difference in blood pressure between males and females?

#=====================#
# Exercise 2 
#=====================#

# clear environment
rm(list = ls())

# read in the data from GitHub
df_gapminder <- read.csv(file = "https://raw.githubusercontent.com/ScHARR-PHEDS/R4ScHARR/master/data/df_gapminder.csv")

# if this file was on my computer I would need to specify the file relative to the working directory I am in:
# df_gapminder <- read.csv(file = "data/df_gapminder.csv")

# lets look at the start of the data-set
head(df_gapminder)

# now lets see some basic summary stats:
str(df_gapminder)
summary(df_gapminder)

# lets see just data from 2007
df_2007 <- df_gapminder[df_gapminder$year == 2007,]
head(df_2007)

# lets see just data from 1952
df_1952 <- df_gapminder[df_gapminder$year == 1952,]
head(df_1952)

# which country had the highest GDPpc in 2007?
# THIS WILL THROW AN ERROR - WE CAN GOOGLE UP THE ERROR MESSAGE.
df_2007[which.max(df_2007$gdpPercap),]
# https://stackoverflow.com/questions/19205806/undefined-columns-selected-when-subsetting-data-frame

#============== QUESTION =======
# which country had the highest GDPpc in 1952?
# df_1952[which.max(df_1952$gdpPercap),]

#============== QUESTION =======
# which country had the longest life expectancy in 2007?
# df_2007[which.max(df_2007$lifeExp),]

# lets create a simple scatter plot for GDPpc & life expectancy in 2007
plot(x = df_2007$gdpPercap,
     y = df_2007$lifeExp,
     type = "p",
     xlab = "GDP per Capita ($)",
     ylab = "Life Expectancy",
     main = "Life Expectancy and GDP per capita in 2007"
)

#============== QUESTION =======
# Can we recreate the plot for 1952?
plot(x = df_1952$gdpPercap,
     y = df_1952$lifeExp,
     type = "p",
     xlab = "GDP per Capita ($)",
     ylab = "Life Expectancy",
     main = "Life Expectancy and GDP per capita in 2007"
)

#there is a problem, can we remove the outlier?
df_plot <- df_1952[-which.max(df_1952$gdpPercap),]

plot(x = df_plot$gdpPercap,
     y = df_plot$lifeExp,
     type = "p",
     xlab = "GDP per Capita ($)",
     ylab = "Life Expectancy",
     main = "Life Expectancy and GDP per capita in 1952"
)

#### these plots are very basic ... is there a more fancy plot than base R plot.

#install.packages(ggplot2)
library(ggplot2)
head(df_gapminder)

# a help file exists within the ggplot package.
# help(ggplot2)


# we can use ggplot as above.
ggplot(data = df_gapminder[df_gapminder$year %in% 1952,],
       aes(x = gdpPercap, y = lifeExp))+
  geom_point()+
  labs(title = "Life Expectancy and GDP per capita in 1952",
       x = "GDP per Capita ($)",
       y = "Life Expectancy")

# but we can change sizes to represent populations
ggplot(data = df_gapminder[df_gapminder$year %in% c(1952),],
       aes(x = gdpPercap, y = lifeExp, size = pop))+
  geom_point()+
  labs(title = "Life Expectancy and GDP per capita in 1952",
       x = "GDP per Capita ($)",
       y = "Life Expectancy")

# and add in colors to represent continents
ggplot(data = df_gapminder[df_gapminder$year %in% c(1952),],
       aes(x = gdpPercap, y = lifeExp, size = pop, col = continent))+
  geom_point()+
  labs(title = "Life Expectancy and GDP per capita in 1952",
       x = "GDP per Capita ($)",
       y = "Life Expectancy")

# and put two plots together to show the change from 1952 to 2007
ggplot(data = df_gapminder[df_gapminder$year %in% c(1952,2007),],
       aes(x = gdpPercap, y = lifeExp, col = continent,size = pop))+
  geom_point()+
  labs(title = "Life Expectancy and GDP per capita in 1952",
       x = "GDP per Capita ($)",
       y = "Life Expectancy")+
  facet_grid(~year)


# the gdp data is not very uniformly distributed, 
# lot of poorer countries and a few rich ones.
hist(df_gapminder[df_gapminder$year %in% c(2007),"gdpPercap"])

# how can we change the scale of the x axis?
# LOOK THIS UP - DON'T KNOW IT OFF TOP OF HEAD.
# cheatsheet: https://rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf
# stack overflow: https://stackoverflow.com/questions/47890742/logarithmic-scale-plot-in-r

# can therefore change the x axis to be on a log scale
ggplot(data = df_gapminder[df_gapminder$year %in% c(1952,2007),],
       aes(x = gdpPercap, y = lifeExp, col = continent,size = pop))+
  geom_point()+
  scale_x_log10()+
  labs(title = "Life Expectancy and GDP per capita in 1952",
       x = "GDP per Capita ($)",
       y = "Life Expectancy")+
  facet_grid(~year) 

# can also change the theme to classic
ggplot(data = df_gapminder[df_gapminder$year %in% c(1952,2007),],
       aes(x = gdpPercap, y = lifeExp, col = continent,size = pop))+
  geom_point()+
  scale_x_log10()+
  labs(title = "Life Expectancy and GDP per capita in 1952",
       x = "GDP per Capita ($)",
       y = "Life Expectancy")+
  theme_classic() + 
  facet_grid(~year) 

# we can store ggplot plots as objects
plot1 <- ggplot(data = df_gapminder[df_gapminder$year %in% c(1952,2007),],
                aes(x = gdpPercap, y = lifeExp, col = continent,size = pop))+
  geom_point()+
  scale_x_log10()+
  labs(title = "Life Expectancy and GDP per capita in 1952",
       x = "GDP per Capita ($)",
       y = "Life Expectancy")+
  theme_classic() + 
  facet_grid(~year) 

ggsave(plot = plot1,
       filename = "outputs/gapminderplot.png")


#========================================================#
# create an animation - this is cool, but no need to repeat.

rm(list = ls())
# install.packages("gganimate")
# this is a development version of gganimate (currently in production)
# devtools::install_github('thomasp85/gganimate')

library(gganimate)
#library(gapminder)

df_gapminder <- read.csv("https://raw.githubusercontent.com/ScHARR-PHEDS/R4ScHARR/master/data/df_gapminder.csv")

theme_set(theme_bw())

# a single animation plot
ggplot(data = df_gapminder,
       aes(x = gdpPercap, y=lifeExp, size = pop, colour = country)) +
  geom_point(show.legend = FALSE, alpha = 0.7) +
  scale_color_viridis_d() +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  labs(x = "GDP per capita ($)", y = "Life expectancy")+
  # animation specific
  transition_time(year) +
  labs(title = 'Year: {frame_time}',x = 'GDP per capita', y = 'life expectancy')

# with a facet
ggplot(df_gapminder, 
       aes(gdpPercap, lifeExp, size = pop, colour = country)) +
  geom_point(alpha = 0.7, show.legend = FALSE) +
  scale_colour_manual(values = country_colors) +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  facet_wrap(~continent) +
  # Here comes the gganimate specific bits
  labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'life expectancy') +
  transition_time(year) +
  ease_aes('linear')

#=============#
# Day 2 Session 2 
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

# Try creating a function: Create a function that calculates the difference 
# between the maximum & mean of the three numbers (x, y, z) and returns a single number.

#This is useful for PSA inputs for health economic modelling, for example:

f_gen_psa <- function(n_sim = 1000){
  
  # creating a vector with values drawn from the beta distribution with the two parameters
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
    
    # added a column with values drawn from the trucated normal distribution with the two parameters
    param2   = rtruncnorm(n = n_sim, 
                       mean = 1, 
                       sd = 0.01, 
                       b = 1)
  )
  
  return(df_psa)
}

f_gen_psa(n_sim = 5)

#====================#
# R Markdown  ----
#====================#

install.packages(rmarkdown)
tinytex::install_tinytex()

#=============#
# Day 3 Session 1 
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


