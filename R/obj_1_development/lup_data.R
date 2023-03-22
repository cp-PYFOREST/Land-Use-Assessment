

# Determine active LUP for year ranges ----------------------------------------------

# Load in libraries
library(terra)
library(here)
library(dplyr)
library(sf)
library(tmap)
library(rgdal)
library(rgeos)



# Create funtion lup_period

# lup_period <- function(start_year, end_year, lup){
#   filter(lup, anho_capa <= end_year & year_inactive >= end_year)
# }

lup_period <- function(start_year, end_year, lup) {
  filtered_lup <- filter(lup, anho_capa <= end_year & year_inactive >= end_year)
  return(filtered_lup)
}



# Read in LUP 
datadir <- path.expand("~/../../capstone/pyforest/data")
lup <- readRDS(file.path(datadir, "active_inactive/active_inactive.rds"))
unique(lup$cod_dpto) #(P,Q,R departments of Chaco)


# Apply function to get active LUP for year ranges 
lup_2000_2005 <- lup_period(2000, 2005, lup)
lup_2005_2011 <- lup_period(2005, 2011, lup)
lup_2011_2013 <- lup_period(2011, 2013, lup)
lup_2013_2015 <- lup_period(2013, 2016, lup)
lup_2015_2017 <- lup_period(2015, 2017, lup)
lup_2017_2018 <- lup_period(2017, 2018, lup)
lup_2018_2019 <- lup_period(2018, 2019, lup)
lup_2019_2020 <- lup_period(2019, 2020, lup)


