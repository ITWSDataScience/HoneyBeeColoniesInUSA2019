# Data Science Honey Bee Code
# 11/21/1019
# Author: Josephine Lyons

# libraries and packages
install.packages("readr")
library(readr)
library(ggplot2)
library(devtools)
devtools::install_dev("remotes")
devtools::install_github("UrbanInstitute/urbnmapr")
library("tidyverse")
library("viridis")
library("urbnmapr")

# open files
honey_production <- read.csv(file="")
bee_population <- read.csv(file="")
pesticides <- read.csv(file="")

# filter data sets (of what is not done already)
# ensure 1998-2014
# take a look to see if any other modifications are needed
summary(honey_production)
summary(bee_population)
summary(pesticides)

# Merge datasets
all_sets <- honey_production + bee_population + pesticides

### Exploratory Data Analysis ###
## Plot year-based relationships ##
# honey-price to colony
ggplot(all_sets, aes(x = , y = )) + geom_point(aes(color = ))  + labs(x = "Price") + labs(color = "Year") + labs(y = "Colonies")
# honey-price to pesticides
ggplot(all_sets, aes(x = , y = )) + geom_point(aes(color = ))  + labs(x = "Price") + labs(color = "Year") + labs(y = "Pesticides")
# pesticides to colony
ggplot(all_sets, aes(x = , y = )) + geom_point(aes(color = ))  + labs(x = "Pesticides") + labs(color = "Year") + labs(y = "Colonies")

# Map of States
# Honey price over years
# pesticide use over years
# colony over years
# URBAN MAPPER for a year (do all in one year)
# Find the top states and use these in the analysis
# From this, use clustering technichques to see if can
# identify these states

# Question 1
# What is the relationship between the national honey 
# production and the honey bee colony population in the 
# United States between the years of 1998 and 2014 and 
# how does this relationship affect the average honey 
# production prices?

# Use results of EDA to determine type of relationship
# (increasing or decreasing)

# Multiple linear regression

# Significane testing


# Question 2
# How has the use of harmful bee killing pesticides 
# correlated with the number of honey bee colonies in the 
# United States between the years 1998 and 2014?

# Use results of EDA to determine type of relationship
# (increasing or decreasing)

# Create line-of-best-fit through regression

# Do significance testing on that line