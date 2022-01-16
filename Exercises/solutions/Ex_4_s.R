#=============#
# Intro to R for Health Economics
# Paul Schneider & Sarah Bates

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
