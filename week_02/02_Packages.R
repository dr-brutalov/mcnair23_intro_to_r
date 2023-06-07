# File:   Packages.R
# Course: R: An Introduction (with RStudio)

# CRAN: https://cran.r-project.org/

# LOAD PACKAGES ############################################

# I recommend "pacman" for managing add-on packages. It will
# install packages, if needed, and then load the packages.
install.packages("pacman")

# Then load the package by using either of the following:
require(pacman)  # Gives a confirmation message.
library(pacman)  # No message.

# Or, by using "pacman::p_load" you can use the p_load
# function from pacman without actually loading pacman.
# These are packages I load every time.
pacman::p_load(pacman, # Package manager
               dplyr, # Used for manipulating DataFrames
               tidyr, # Cleaning up information
               stringr, # Working with string/text information
               lubridate, # Manipulate date information
               httr, # Working with website data
               ggvis, # Grammar of Graphics (active visualizations)
               ggplot2, # Common data visualization package
               shiny, # Used to make web-embedded applications
               rio, # R input/output importing/exporting data
               rmarkdown, # Allows for the creating of "rich documents"
               GGally,
               ggthemes, 
               plotly
               )

library(datasets)  # Load/unload base packages manually

# CLEAN UP #################################################

# Clear packages
p_unload(dplyr, tidyr, stringr) # Clear specific packages
p_unload(all)  # Easier: clears all add-ons
detach("package:datasets", unload = TRUE)  # For base

# Clear console
cat("\014")  # ctrl+L

# Clear mind :)
