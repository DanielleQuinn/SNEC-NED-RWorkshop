# R Script Fundamentals ----
# This is an R script; it is a document that contains the
# set of instructions or processes that we want to evaluate

# Note: a "#" indicates a comment; R will not try to interpret this as code

# - Running Code ----
# 1) Select the code you want to evaluate
  ## Option A: Highlight the code
  ## Option B: Place the cursor anywhere in the line of code

# 2) Evaluate the code
  ## Option A: Click on "Run"
  ## Option B: Use a shortcut

# Shortcuts for evaluating code:
  ## On Windows, Ctrl-Enter to run a line of code
  ## On Mac Cmd-Enter

# You should see > in the lower left hand corner of the Console window
# If you see + you have missed a piece of code and R is waiting
  ## Click in the Console and hit Escape to reset
# If you see     R is running a process in the background

# Operators ----
# - Mathematical Operators ----
# Used to do arithmetic
           # + for addition
           # -  for subtraction
           # * for multiplication
           # / for division
           # ^ for exponent
           # ** for exponent (alternative)
           # %% for modulus ("remainder")
           # %/% for integer division
           # order of operations is followed

# - Conditional Operators ----
# Used to write Logical Statements, which return TRUE or FALSE
           # 5 is greater than 6
           # 5 is greater than or equal to 6
           # 5 is less than 6
           # 5 is less than or equal to 6
           # 5 is equal to 6

           # 5 is not greater than 6
           # 5 is not greater than or equal to 6
           # 5 is not less than 6
           # 5 is not less than or equal to 6
           # 5 is not equal to 6
           # 5 is not equal to 6

           # 5 is equal to 5 AND 7 is greater than 6
           # 5 is equal to 5 OR 7 is greater than 10


# Functions ----
# Functions "do things"
# FunctionName(argument)

# Goal: Find the square root of 81
# Function name: sqrt
# Argument: 81


# Goal: Find the absolute value of 6 - 14
# Function name: abs
# Argument: 6 - 14


# - Arguments ----
# RULE: Functions require specific types of arguments


# To learn more about a function, use ?


# RULE: Arguments are named, but it's not always neccessary to call them by name
# sqrt() requires an argument named 'x', which we specifiy to be 10



# Some functions use more than one argument
  # FunctionName(argument1, argument2, argument3)

# There are required arguments and optional arguments;
# optional arguments have default values
  # FunctionName(required1, required2, optional3 = 10)

# Look at the documentation for rnorm()


# Goal: Return 20 random values from a normal distribution
# that has a mean of 0 and a standard deviation of 1


# n is a required argument; a value must be provided
# mean is an optional argument; defaults to mean = 0
# sd is an optional argument; defaults to sd = 1


# What if we don't supply a value for the n argument?


## Goal: Return 20 random values from a normal distribution
## that has a mean of 0 and a standard deviation of 6


## Do these accomplish the same task?
rnorm(20, 0, 6)                 # Pros and cons?
rnorm(mean = 0, n = 20, sd = 6) # Pros and cons?
rnorm(n = 20, sd = 6)           # Pros and cons?

# - Nested Functions ----
# Functions are evaluated from the inside out

# Goal: Find the square root of the absolute value of 6 - 14

## Goal: Return 20 random values from a normal distribution
## that has a mean of 0 and a standard deviation of the
## square root of 23


# Objects ----
# Objects ("containers", "boxes") store information
# in your current environment ("room", "desk")

# Some commonly used objects come "built in"
# You create other objects you want to be able to use later

# Goal: Find the value of the object called pi


# Goal: Use pi to accomplish a task


# Goal: Create an object called x that contains the value 15
# Use the Assignment Operator <-


# Look at the contents of the object called x


# RULE: R is case sensitive


## Goal: Make an object called y that contains the value of x plus 3


# RULE: If you update x, y does not update automatically

# This is different from some programming languages that
# you may have experience with - be careful!

## Without running this code, what do you expect to get as output?
a <- 10
b <- 15
A <- 100
c <- a + b
b <- 50
c

# (a) 115
# (b) 25
# (c) 150
# (d) 60

# - Rules for Naming Objects ----
## May contain letters (uppercase or lowercase)
## May contain numbers
## May contain . or _
## Must start with a letter
## May not contain spaces

# - Advice for Naming Objects ----
## Keep names short but meaningful
## Avoid (or be very consistent) using capitalization
## Avoid (or be very consistent) using punctuation
## Avoid . (other meanings here and in other programming languages)

# Data Classes ----
# Objects can contain different classes of data
# Think of this as the key descriptive characteristic of the item in the container

# Numeric


# Note: 'Numeric' actually includes two different types of numbers
  # Integers: integer values
  # Doubles: contain decimals

# Character

# Logical

# Other common data classes include Factors (categorical groupings) & a variety of Date/Datetime options

# Data Structures ----
# Objects can contain different structures of data
# Think of this as the shape or layout of the container that is used to hold an item

# - Scalars ----
# 1 element, 1 dimensional


# - Vectors ----
# >1 element; 1 dimensional

# Example: Look at a built in object containing the alphabet


# Note: [*] represents the position of each value in the vector

# Use : as a shortcut for vectors of integers


# Goal: Put all integers from 4 to 11 into the object called myvector


# -- Vectors: Functions and Operators ----
# We learned that functions require specific data classes
# Different functions respond differently to data structure
sqrt(myvector)   # applied to each value in the vector
length(myvector) # applied to the entire vector
class(myvector)  # applied to the entire vector

# Conditional Operators
          # Each element is greater than 5
          # Any element is greater than 5
          # All elements are greater than 5

# a %in% b     "the scalar a is in the vector b"
          # "11 is in myvector"
          # "'b' is in letters"

# Creating customized vectors - Numeric

# Goal: Create a vector called myvalues that contains
# the numbers 1, 6, 3, 4, and 10

## How many elements are in myvalues?

## Determine if 25 is found in myvalues

## What is the sum of myvalues?

## Create a vector called aboutme that contains four elements:
  # The number of letters in your first name
  # The number of siblings you have
  # The number of pets you own
  # The first letter of your last name

# -- Vectors: Rules ----
# Vectors are "atomic": they can only contain one class of data

# Implication: You can't mix data classes!

# Goal: What is the total number of eggs?

# Goal: Create a new object called numbereggs that contains
# the values from eggs, but forced to act as numeric values

# Goal: What is the total/average/minimum/maximum number of eggs?


# Missing values are represented by NA

# Goal: Calculate basic statistics while ignoring the NAs

# Goal: Assess which values are NAs
# A special function that acts like a conditional operator: is.na()
# is.na(x)    "x is NA"

# Each value of numbereggs is NA

# Each value of numbereggs is not NA

# More complex functions and processes will often deal with
# missing values in a more reasonable way
# Example: visualizations, most statistical tests and models ignore NAs by default
