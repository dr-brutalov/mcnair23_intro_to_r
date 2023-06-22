# File:   correlation_analysis.R
# Course: R: An Introduction (with RStudio)

# Setup ################################################

# Installs pacman ("package manager") if needed
if (!require("pacman")) install.packages("pacman")

# Use pacman to load add-on packages as desired
pacman::p_load(pacman, rio)

# Correlation Analysis Example ################################

# CSV Load
sc_csv <- import("~/mcnair23_intro_to_r/week_02/data/shark_attacks.csv")
typeof(sc_csv)


# Give the Data a Quick Look #######################################
head(sc_csv)
summary(sc_csv)

plot(sc_csv)

?cor

typeof(sc_csv$Temperature)

full.std.cor <- cor(sc_csv)
print(full.std.cor)

cones <- sc_csv$IceCreamSales
sharks <- sc_csv$SharkAttacks

plot(cones, sharks)

std.cor <- cor(sc_csv)
print(std.cor)

cor.test(cones, sharks)

std.spr <- cor(cones, sharks, method = "spearman")

std.ken <- cor(sharks, cones, method = "kendall")

# CLEAN UP #################################################

# Clear environment
rm(list = ls()) 

# Clear packages
p_unload(all)  # Remove all add-ons
detach("package:datasets", unload = TRUE)   # For base

# Clear console
cat("\014")  # ctrl+L

# Clear mind :)
