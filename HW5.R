# Section 1: 使用 %>% 簡化這段程式
load(url("https://storage.googleapis.com/r_rookies/straw_hat_df.RData"))
this_year <- as.numeric(format(Sys.Date(), '%Y'))
birth_year <- this_year - straw_hat_df$age
birth_date_chr <- paste(birth_year, straw_hat_df$birthday, sep = "-")
straw_hat_df$birth_date <- as.Date(birth_date_chr)

View(straw_hat_df)


#Simplify the original code
library(magrittr)
load(url("https://storage.googleapis.com/r_rookies/straw_hat_df.RData"))
straw_hat_df$birth_date <-  Sys.Date() %>%
  format(.,"%Y") %>%
  as.numeric() %>%
  `-` (straw_hat_df$age) %>%
  paste(.,straw_hat_df$birthday, sep = "-") %>%
  as.Date()
 
View(straw_hat_df)


#Section 2:計算 BMI 將 bmi 變數加入 data frame
heights <- c(173, 168, 171, 189, 179)
weights <- c(65.4, 59.2, 63.6, 88.4, 68.7)
heights_and_weights <- data.frame(heights, weights)
View(heights_and_weights)

heights_m <- heights/100
heights_m

heights_and_weights$BMI <- (weights) / (heights_m)^2
View(heights_and_weights)