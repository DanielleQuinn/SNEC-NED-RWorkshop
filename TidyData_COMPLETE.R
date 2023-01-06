# Importing Data ----
# Look at the names of the files available in your working directory
list.files()

# parks.csv is in "comma separated values" format
parks <- read.csv("parks.csv") # Create an object called parks containing the data frame

# Exploring Data ----
# - Preview ----
head(parks)    # Print the first six rows
tail(parks)    # Print the last six rows
View(parks)    # View the data in a separate tab

# - Structure ----
nrow(parks)    # How many rows?
ncol(parks)    # How many columns?
dim(parks)     # How many rows and columns?
names(parks)   # Print column names

# - Class ----
str(parks)     # Print detailed view of data

# - Values ----
# Columns can be extracted as vectors using $
# objectname$component
parks$park_name   # Look at the values in the park_name column
parks$acres       # Look at the values in the acres column

# Assessing Data ----
# - Numeric Variables ----
summary(parks) # Summary statistics of each column

# - Character Variables ----
unique(parks$state)         # Print unique state values
length(unique(parks$state)) # How many unique state values?

# - Simple Tables ----
table(parks$state) # Count occurrences of each state

# Exercise ----
## Each park should have exactly one row in the data
## Which technique(s) would you use to confirm that no parks are repeated?
nrow(parks)                     # 56 rows
length(unique(parks$park_name)) # 56 unique park names
# or
table(parks$park_name) # Scroll through output and make sure they are all 1
