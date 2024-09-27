#### Preamble ####
# Purpose: Simulates data
# Author: Siyuan Lu
# Date: 23 September 2024
# Contact: siyuan.lu@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)


#### Simulate data ####
# Set seed
set.seed(304)

# Define the start and end date
start_date <- as.Date("2023-01-01")
end_date <- as.Date("2023-12-31")

# Set the number of random dates you want to generate
number_of_dates <- 100

# Generate a set of random numbers following the pattern
data <- tibble(
  dates = as.Date(
    runif(
      n = number_of_dates,
      min = as.numeric(start_date),
      max = as.numeric(end_date)
    ),
    origin = "1970-01-01"
  ),
  number_of_budget = rpois(n = number_of_dates, lambda = 10)
)


#### Write_csv ####
write_csv(data, file = "TPS-Budget/data/raw_data/simulated.csv")