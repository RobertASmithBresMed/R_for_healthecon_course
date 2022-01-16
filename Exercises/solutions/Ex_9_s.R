#=============#
# Intro to R for Health Economics
# Paul Schneider & Sarah Bates

# SOLUTION 9

# 1. Create vectors for the costs and utility of each treatment group
#  (e.g. v_u_trt    <- c(u_H, u_Trt, u_S2, u_D)
v_u_trt    <- c(u_H, u_Trt, u_S2, u_D)
v_u_no_trt <- c(u_H, u_S1, u_S2, u_D)
v_c_trt    <- c(c_H, c_S1 + c_Trt, c_S2 + c_Trt, c_D)
v_c_no_trt <- c(c_H, c_S1, c_S2, c_D)

v_u_trt
v_u_no_trt
v_c_trt
v_c_no_trt

#  2. Estimate mean costs and QALYs for each year (hint: need to use matrix 
#  multiplication, matrix trace %*% vector of costs and utilities)

v_E_no_trt <- m_TR %*% v_u_no_trt
v_E_trt    <- m_TR %*% v_u_trt
v_C_no_trt <- m_TR %*% v_c_no_trt
v_C_trt    <- m_TR %*% v_c_trt

head(v_E_no_trt)
head(v_E_trt)
head(v_C_no_trt)
head(v_C_trt)

#  3. If you didn't in the the previous step, apply discount weights (hint: need
#  to use transpose function t() and matrix multiplication, 
#  e.g. t(vector of costs) %*% discount rate 

te_no_trt <- t(v_E_no_trt) %*% v_dwe  
te_trt    <- t(v_E_trt) %*% v_dwe
tc_no_trt <- t(v_C_no_trt) %*% v_dwc
tc_trt    <- t(v_C_trt)    %*% v_dwc

#  4. Create results table by combining the 4 vectors
results <- c(
  "Cost_NoTrt" = tc_no_trt, 
  "Cost_Trt"   = tc_trt, 
  "QALY_NoTrt" = te_no_trt, 
  "QALY_Trt" = te_trt,
  "ICER" = (tc_trt - tc_no_trt)/
    (te_trt - te_no_trt)
)