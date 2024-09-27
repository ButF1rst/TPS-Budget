#### Preamble ####
# Purpose: Clean the raw police budget data into an analysis dataset
# Author: Siyuan Lu
# Date: 23 September 2024
# Contact: siyuan.lu@mail.utoronto.ca
# License: MIT
# Pre-requisites: Need to have downloaded the data
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)


#### Clean data ####
# Read raw data
raw_data <- read_csv("data/raw_data/raw_data.csv")

# Clean data, standardize column names, create new column date, remove unwanted columns
cleaned_data <-
  raw_data |>
  janitor::clean_names() |> 
  mutate(date = lubridate::ymd(paste(fiscal_year, "12", "31", sep = "-"))) |>
  select(-fiscal_year, -budget_type, -command_name, -pillar_name, -district_name, -unit_name, -cost_element)


#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")