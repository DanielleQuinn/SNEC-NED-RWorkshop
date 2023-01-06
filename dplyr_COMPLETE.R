# Packages ----
# Packages are user-created collections of objects, functions, and datasets that
# can be installed to RStudio and used to accomplish common tasks

# The {tidyverse} is a collection of packages that share an
# underlying design philosophy, grammar, and data structures and
# work with "tidy data", which follows specific rules and best practices

# {dplyr}: data manipulation
# {ggplot2}: visualizing data
# {tidyr}: tidying data
# {lubridate}: working with dates and times
# {broom}: tidying output from models
# {stringr}: working with strings
# {forcats}: working with factors
# {purrr}: functional programming
# {rvest}: web scraping

# https://www.tidyverse.org/packages/

# - Load Packages ----
library(lubridate)
library(dplyr)

# Import Data ----
parks <- read.csv("parks.csv")

# Subsetting Data with {dplyr} ----
# - select() ----
# select() : selects columns from a data frame and outputs as a data frame
# Goal: Output the column called year
select(parks, year)

# Goal: Output the columns called park_name and state
select(parks, park_name, state)

# Goal: Convert the data frame to a tibble for easier viewing
parks_tb <- as_tibble(parks)
# A tibble is essentially the same as a data frame, with some extra features
# Today, primarily just the way the output is shown; more user friendly
parks
parks_tb

## Goal: Output the columns called park_name, latitude, and longitude from
## (a) the parks data frame
select(parks, park_name, latitude, longitude)
## (b) the parks_tb tibble
select(parks_tb, park_name, latitude, longitude)

# - filter() ----
# filter() : filters rows from a data frame
# Example: Output the rows that correspond to parks established prior to 1910
filter(parks_tb, year < 1910)

# Goal: Output the rows that correspond to parks from California (CA)
filter(parks_tb, state == "CA")

## What is the output from the following line of code?
filter(parks_tb,
       year %in% 1950:1980,
       acres > 50000)

## Output the rows that correspond to parks established in the
## first six months of any year, in Florida (FL)
filter(parks_tb,
       month <= 6,
       state == "FL")

# Creating Workflows ----
# Information is put into a "pipe"
# It comes out the other side and is used
# as the first argument for the function that awaits

###
# 'Typical' pipe: %>% from {tidyverse}
# New pipe (May 18, 2021): |> from {base}
###

# Goal: Find the square root of 81
81 %>% sqrt()              # 81 becomes the argument for sqrt()

# Goal: Output the column called year
select(parks_tb, year)     # Standard use of select()

parks_tb %>% select(year)  # Pipeline use of select()
# parks_tb becomes the first argument for select()

# This can also be written as
parks_tb %>%
  select(year)

# Pipes are valuable when we want to perform multiple steps

# Goal: Find the square root of the absolute value of -16
# Nesting functions:
sqrt(abs(-16))  # The output of abs(-16) becomes the argument for sqrt()

# Using pipes:
-16 %>%
  abs() %>%
  sqrt()

# Goal: Considering only parks established prior to 1910,
# ouput the columns called year, park_name, and state
parks_tb %>%
  filter(year < 1910) %>%
  select(year, park_name, state)

## Can you explain why this gives the same output?
parks_tb %>%
  select(year, park_name, state) %>%
  filter(year < 1910)

## What would happen if you tried to run this?
parks_tb %>%
  select(park_name, state) %>%
  filter(year < 1910)

## Choose any state. Output the park name, cost of an annual pass,
## and latitude and longitude of parks in that state
parks_tb %>%
  filter(state == "AK") %>%
  select(park_name, annual_pass, latitude, longitude)

## Output park_code and acres columns from parks in that state
## that are at least 70000 acres in area
parks_tb %>%
  filter(state == "AK",
         acres >= 70000) %>%
  select(park_code, acres)

# Modifying Data with {dplyr} ----
# - mutate() ----
# mutate() : creates a column or modifies an existing column

# Use case #1: Creating a new column

# Goal: Create a new column called user that contains your name
parks_tb %>%
  mutate(user = "Danielle")

glimpse(parks_tb) # What do you notice?

# To make the change permanent, you need to overwrite the
# original object
parks_tb <- parks_tb %>%
  mutate(user = "Danielle")  # "replace parks_tb with this new version"

glimpse(parks_tb)

# Use case #2: Creating a new column based on calculations from an existing column

# Goal: Convert acres to square kilometers (divide acres by 247)
parks_tb %>%
  mutate(sq_km = acres/247)

parks_tb <- parks_tb %>%
  mutate(sq_km = acres/247)

## Goal: Create column of park age
parks_tb <- parks_tb %>%
  mutate(age = 2021 - year)

# Use case #3: Creating a new column based on logic statements about an existing column

# Goal: Create a column that describes if the park is free (TRUE) or paid (FALSE)
parks_tb <- parks_tb %>%
  mutate(free = per_person == 0)

glimpse(parks_tb)

## Goal: Create a column that is "Old" if the park is more than
## 50 years old and "New" if it is not
parks_tb <- parks_tb %>%
  mutate(age_class = ifelse(age > 50, "Old", "New"))

glimpse(parks_tb)

# Exploratory Data Analysis with {dplyr} ----
# - group_by() ----
# group_by() : splits your data into groups based on the variables you specify
# Goal: Group by state
parks_tb %>%
  group_by(state)

# - summarise() ----
# summarise() : returns a single value based on the instructions you give it

# Goal: Find the maximum entrance fee (per_person)
parks_tb %>%
  summarise(max(per_person))

## Goal: Find the minimum year a park was established
parks_tb %>%
  summarise(min(year))

# - group_by() & summarise () ----
# Goal: Use group_by() and summarise() together to find the
# total area (acres) of parks, by state
parks_tb %>%
  group_by(state) %>%
  summarise(sum(acres))

# This can be stored as a data frame object
total_area <- parks_tb %>%
  group_by(state) %>%
  summarise(sum(acres))
total_area  # Look at the contents of total_area

# The column names can be specified in summarise
total_area <- parks_tb %>%
  group_by(state) %>%
  summarise(total_acres = sum(acres))
total_area

# Goal: What is the average park size and average entrance
# fee (per_person), by state?
parks_tb %>%
  group_by(state) %>%
  summarise(average_size = mean(acres),
            average_cost = mean(per_person))

## Goal: What is the first year and most recent year that
## a park was established in each state?
parks_tb %>%
  group_by(state) %>%
  summarise(first_year = min(year),
            recent_year = max(year))

# - Other summarise() functions ----
# -- n() ----
# n() : counts occurences in each group using summarise()
## Remember here that each record represents exactly one park
## and each park is represented by exactly one row

# Goal: How many parks in each state?
parks_tb %>%
  group_by(state) %>%
  summarise(parks = n())

# Goal: How many parks in each state, by age_class?
parks_tb %>%
  group_by(state, age_class) %>%
  summarise(parks = n())

## Goal: How many new parks were established each year?
parks_tb %>%
  group_by(year) %>%
  summarise(new_parks = n())

# -- n_distinct() ----
# n_distinct() : counts unique occurences of a variable in each group using summarise()

# Goal: How many different states had new parks established each year?
parks_tb %>%
  group_by(year) %>%
  summarise(number_states = n_distinct(state))

# Exercise ----
# Choose five states.
# Generate a table using a {dplyr} workflow that describes, for each state:
# (a) the number of parks
# (b) the smallest area
# (c) the last time a new park was established
# (d) the average entrance fee (per person)
# (e) extra challenge: how many free parks it has
##### hint: think about characteristics of data classes
parks_tb %>%
  filter(state %in% c("AK", "FL", "CA", "NM", "ME")) %>%
  group_by(state) %>%
  summarise(number_parks = n(),
            smallest_area = min(acres),
            last_established = max(year),
            average_cost = mean(per_person),
            free_parks = sum(free))
