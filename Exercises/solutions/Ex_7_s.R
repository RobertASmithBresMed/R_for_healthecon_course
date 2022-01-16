#=============#
# Intro to R for Health Economics
# Paul Schneider & Sarah Bates

# EXERCISE 7: Create a probabilistic function
# Create a function 'flipCoin' that takes 'n' ar an argument and
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

