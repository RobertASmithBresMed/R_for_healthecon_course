# ==============
# Intro to R for Health Economics
# Paul Schneider & Sarah Bates
# ==============


# Matrix multiplication exercise

rm(list = ls())

# define parameters
state_names = c("Healthy", "Sick", "Dead")
n_states = length(state_names)   # the length function is fairly intuitive
n_t = 10     # time horizon

# create transition matrix
m_P <- matrix(data = NA,
              nrow = n_states,
              ncol = n_states,
              dimnames = list(state_names,state_names)
              )

# fill transition matrix with values.
m_P[1, ] <- c(0.8, 0.15, 0.05)  
m_P[2, ] <- c(0, 0.7, 0.3)
m_P[3, ] <- c(0, 0, 1)

# check matrix
m_P

# create Markov Trace matrix.
m_T <- matrix(data = NA,
              nrow = n_t,
              ncol = n_states,
              dimnames = list(paste0("cycle_",1:n_t), state_names))

# check the Markov Trace
m_T


#1. Initialize the first period of the Markov Trace. (100% of the population starts Healthy).




#2. Use matrix multiplication to multiply the first row of the Markov Trace (m_T) by the Transition Matrix (m_P).
#   and store the resulting values in the second row of the Markov Trace.


# HINT: Since we start with 1 - 0 - 0  we should end up with 0.8 - 0.15 - 0.05 in the second period. 
# if you don't have this something has gone wrong :)


#3. Use the for-loop function to repeat this process until the matrix is fully populated.
for(t in 2:n_t){
  
  # < insert code here >
  
}

# check this looks correct




# Extension. Wrap this whole process into a function that takes as arguments:
# 1) an initialized Markov Trace.
# 2) transition Matrix 
# arguments.



# run this and assign to a new markov trace


# check these give the same results




