# File:   01_sample_data_exploration.R
# Course: R: An Introduction (with RStudio)
# Some code snippets generated by the May24 2023 version of ChatGPT
# Data was sourced from the Diabetes Dataset, available on Kaggle
# https://www.kaggle.com/datasets/mathchi/diabetes-data-set?resource=download

# Import Necessary Packages ###############################
# Installs pacman ("package manager") if needed
if (!require("pacman")) install.packages("pacman")

# Use pacman to load add-on packages as desired
pacman::p_load(pacman, dplyr, summarytools, cluster, ggplot2)

# Load in the full dataset
data <- read.csv("~/su23/mcnair23_intro_to_r/data/complete_diabetes_dataset.csv")

# View the structure of the dataset
str(data)

# Descriptive statistics
summary(data)

# Calculate mean and standard deviation of a specific variable
mean_value <- mean(data$Glucose)
sd_value <- sd(data$Glucose)

# Calculate the correlation between two variables
correlation <- cor(data$Glucose, data$Outcome)

# Calculate the correlation matrix for the data
(full.std.cor <- cor(data))

# Create a histogram
hist(data$Pregnancies, main = "Histogram", xlab = "Number of of Times Pregnant")

# Create a boxplot
boxplot(data$Pregnancies, main = "Boxplot", ylab = "Number of Times Pregnant")

# Perform a t-test
t_test <- t.test(data$Glucose, data$BloodPressure)

# Perform a chi-square test
chi_square_test <- chisq.test(data$Glucose, data$BloodPressure)

# Better H. Clustering ##################################

# Perform hierarchical clustering
dist_matrix <- dist(data)   # Calculate distance matrix
hclust_result <- hclust(dist_matrix, method = "ward.D2")   # Perform hierarchical clustering

# Determine the number of clusters
# You can use different methods like silhouette analysis or elbow method
# Here, we set the number of clusters to 3
num_clusters <- 3

# Cut the dendrogram to obtain clusters
clusters <- cutree(hclust_result, k = num_clusters)

# Add cluster assignments to the original dataset
data$cluster <- clusters

# Visualize the clustering results
ggplot(data, aes(x = Glucose, y = BloodPressure, color = factor(cluster))) +
  geom_point() +
  labs(title = "Hierarchical Clustering", x = "Glucose", y = "BloodPressure") +
  theme_minimal()

# Cleaning Things Up #######################

# Clear environment
rm(list = ls()) 

# Clear console
cat("\014")  # ctrl+L
