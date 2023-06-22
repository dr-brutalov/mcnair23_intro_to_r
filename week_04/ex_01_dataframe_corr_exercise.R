# File:   ex_01_dataframe_corr_exercise.R
# Course: R: An Introduction (with RStudio)

# Setup ################################################

# Installs pacman ("package manager") if needed
if (!require("pacman")) install.packages("pacman")

# Use pacman to load add-on packages as desired
pacman::p_load(pacman, rio, dplyr)

# Correlation Analysis Example ################################

# CSV Load
sc_csv <- import("~/mcnair23_intro_to_r/week_02/data/shark_attacks.csv")
typeof(sc_csv)

# Refactoring the Data ###############################
# Guiding question: What if we wanted add a factor to the months to label them
# as a character rather than a number?

convertMonths <- function(months) {
  month_names <- c("January", "February", "March", "April", "May", "June",
                   "July", "August", "September", "October", "November", "December")
  factor(months, levels = 1:12, labels = month_names)
}

encoded_months <- c(3, 6, 9, 12)
converted_months <- convertMonths(encoded_months)
print(converted_months)

months <- sc_csv$Month

f.months <- convertMonths(months)

sc_df <- cbind.data.frame(sc_csv$Year,
                          f.months,
                          sc_csv$SharkAttacks,
                          sc_csv$Temperature,
                          sc_csv$IceCreamSales)

head(sc_df)

# Change the labels in the DataFrame to be consistent with the original data
summary(sc_df)

plot(sc_df)

# This line of code will throw an error. Assuming we want to continue to use a
# DataFrame, use Google or other resources to calculate the correlation values
# for the whole dataset
full.std.cor <- cor(sc_df)

rm(list = ls()) 

# Clear packages
p_unload(all)  # Remove all add-ons
detach("package:datasets", unload = TRUE)   # For base

# Clear console
cat("\014")  # ctrl+L
