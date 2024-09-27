#### Preamble ####
# Purpose: Sanity check of the data
# Author: Siyuan Lu
# Date: 23 September 2024
# Contact: siyuan.lu@mail.utoronto.ca
# License: MIT
# Pre-requisites: Need to have simulated data
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)


#### Test data ####
# Read simulated data
data <- read_csv("TPS-Budget/data/raw_data/simulated.csv")

# Test for negative numbers
data$number_of_budget |> min() <= 0

# Test for NAs
all(is.na(data$number_of_budget))