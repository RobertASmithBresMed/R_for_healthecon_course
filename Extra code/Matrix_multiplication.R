#=============#
# Intro to R for Health Economics
# Paul Schneider & Sarah Bates
# Matrix multiplication example
#=============#


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
