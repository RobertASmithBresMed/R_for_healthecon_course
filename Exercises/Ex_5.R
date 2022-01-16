#=============#
# Intro to R for Health Economics
# Paul Schneider & Sarah Bates

# check if row sum to 1

m_P <- matrix(data = NA,
              nrow = 3, 
              ncol = 3,
              dimnames = list(c("H", "S","D"), c("H", "S","D")))

m_P["H", ]  <- c(0.9,0.25,0.05)
m_P["S", ]  <- c(0.3,0.5,0.2)
m_P["D", ]  <- c(0,0,1)

# Using for loop, check if each row sums to 1 (hint: use sum() function)

for (i in 1:nrow(m_P)) {
  
  
}