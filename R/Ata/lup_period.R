
library(terra)
library(here)
library(dplyr)
library(sf)
library(tmap)
library(rgdal)
library(rgeos)

# create funtion pul_period

lup_period <- function(start_year, end_year, lup){
  filter(lup, anho_capa <= end_year & year_inactive >= end_year)
}

#import the lup
lup <- readRDS("D:/UCSB/capstone/Project/Data Exploration/Data/active/active_inactive.rds")


lup_2000_2005 <- lup_period(2000, 2005, lup)
lup_2005_2011 <- lup_period(2005, 2011, lup)
lup_2011_2013 <- lup_period(2011, 2013, lup)
lup_2013_2015 <- lup_period(2013, 2016, lup)
lup_2019_2022 <- lup_period(2019, 2022, lup)


