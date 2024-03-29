#=============#
# Intro to R for Health Economics
# Paul Schneider & Sarah Bates

# EXERCISE 2: 

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

