#########################################
# Reset environment
rm(list = ls())

# Set the working directory
setwd("C:/Users/GS60.MSI/Documents/GitHub/india_shapefiles_2020")

# Install (if not installed) + Load required packages using the pacman package
if (!require("pacman"))
  install.packages("pacman")
pacman::p_load(sf, ggplot2)

#########################################
# MERGING SHAPEFILES - DISTRICT

## List all the shapefiles in the folder
in_district <-
  list.files("district/states", pattern = "*shp", full.names = TRUE)


## Read in all the shapefiles and merge them
in_district <- do.call(rbind, lapply(in_district, read_sf))

## Write to a new shapefile
sf::st_write(in_district,
             "district/in_district.shp",
             update = TRUE,
             delete_dsn = T)

#########################################
# CHECK IF SHAPEFILE IS MERGED CORRECTLY

ggplot(data = in_district) +
  aes(fill = stname) +
  geom_sf() +
  theme_minimal() +
  theme(legend.position = 'none')
