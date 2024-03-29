#=============#
# Intro to R for Health Economics
# Paul Schneider & Sarah Bates

# EXERCISE 2: 

# Solution

# 1.Select the 3rd row from the data frame dat

dat[3,]

# 2.Select the weight variable from the data frame using your preferred method.
##Info: Remember, there are multiple ways to do this: you can use the $ to index the right column, or use the [ , ] with a number or a “variable_name”.

dat$weight 
# or dat[,2] 
# or dat[,"weight"]

# 3.Select Alice’s data from the data frame.
##Info: It might be helpful to type in dat and press  . to check which row Alice’s data is in.

dat[1,]

# 4.Print dat without it’s first row
##Info: You can select rows 2,3, and 4, but you can also show everything except row 1 - try the latter approach.

dat[-1,]
# but you could also use:
# dat[2:4,]
# or
# dat[ c(F, T, T, T), ]

# 5.Subset the data frame to show just the data for the females
##Info: Remember, F (=FALSE) and "F" (= F as a character) have different meanings in R.

female <- dat$sex == "F"
dat[female,]

# 6. Create a vector primes with elements 2,3,5,7, and 11.
##Info: You can combine elements into a vector with the c(element_1, element_2,...) command.

primes <- c(2,3,5,7,11)  

# 7.Print all primes that are larger than or equal to 5 using subsetting.

primes[primes >= 5]

# 8.Create an ‘animal top speed data frame’: speed_dat. It should have three columns, named animal, speed, flying, and should contain the following information:

#The "lion" can run 80km/h, it’s not flying.
#The "marlin" can swim 129km/h, it’s also not flying.
#Finally, the "eagle" can do 240km/h, and of course it’s flying.

#Info 1: The vector flying should be set to TRUE or FALSE.
#Info 2: Use data.frame(vector_1, vector_2,...) to combine multiple vectors into a data frame.

animal <- c("lion", "marlin", "eagle")  
speed <- c(80, 129, 240)
flying <- c(F, F, T)
speed_dat <- data.frame(animal, speed, flying)
speed_dat
