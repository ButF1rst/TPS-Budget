#### Preamble ####
# Purpose: Download and save the data from Open Data Toronro
# Author: Siyuan Lu
# Date: 23 September 2024
# Contact: siyuan.lu@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)


#### Download data ####
# Get package
package <- show_package("668434ee-9541-40a8-adb6-0ad805fcc9b6")

# Get all resources for this package
resources <- list_package_resources("668434ee-9541-40a8-adb6-0ad805fcc9b6")

# Identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# Load the fifth datastore resource as a sample
data <- filter(datastore_resources, row_number()==5) %>% 
  get_resource()


#### Save data ####
write_csv(data, "data/raw_data/raw_data.csv")