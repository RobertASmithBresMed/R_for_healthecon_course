#=============#
# Intro to R for Health Economics
# Paul Schneider & Sarah Bates

# EXERCISE 8
# 1. Set up remaining inputs
#-------------------------
# Costs c_:
# Healthy Sick Sicker Dead Treatment
# 2000    4000 15000  0    12000
#-------------------------
# Utilities u_:
# Healthy Sick Sicker Dead Treatment
# 1       0.75 0.5    0    0.95
#-------------------------

# SOLUTION
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
