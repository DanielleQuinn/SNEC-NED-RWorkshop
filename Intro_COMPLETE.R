# R Script Fundamentals ----
# This is an R script; it is a document that contains the
# set of instructions or processes that we want to evaluate

# Input goes here; the "Source" window
# Output will appear in the "Console" window

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
5 + 6           # + for addition
5 - 9           # -  for subtraction
6 * 7           # * for multiplication
7 / 13          # / for division
2 ^ 5           # ^ for exponent
2 ** 5          # ** for exponent (alternative)
5 %% 2          # %% for modulus ("remainder")
10 %/% 3        # %/% for integer division
(4 + 5)/6       # order of operations is followed

# - Conditional Operators ----
# Used to write Logical Statements, which return TRUE or FALSE
5 > 6           # 5 is greater than 6
5 >= 6          # 5 is greater than or equal to 6
5 < 6           # 5 is less than 6
5 <= 6          # 5 is less than or equal to 6
5 == 6          # 5 is equal to 6

!5 > 6          # 5 is not greater than 6
!5 >= 6         # 5 is not greater than or equal to 6
!5 < 6          # 5 is not less than 6
!5 <= 6         # 5 is not less than or equal to 6
!5 == 6         # 5 is not equal to 6
5 != 6          # 5 is not equal to 6

5 == 5 & 7 > 6  # 5 is equal to 5 AND 7 is greater than 6
5 == 5 | 7 > 10 # 5 is equal to 5 OR 7 is greater than 10


# Functions ----
# Functions "do things"
# Recognizable by the function name followed by `(`
# Every `(` needs a `)`
# The information inside the `()` is called the argument

# FunctionName(argument)

# Goal: Find the square root of 81
# Function name: sqrt
# Argument: 81
sqrt(81)

# Goal: Find the absolute value of 6 - 14
# Function name: abs
# Argument: 6 - 14
abs(6 - 14)

# - Arguments ----
# RULE: Functions require specific types of arguments
sqrt("a")

# To learn more about a function, use ?
?sqrt

# RULE: Arguments are named, but it's not always neccessary to call them by name
# sqrt() requires an argument named 'x', which we specifiy to be 10
sqrt(x = 10)  # set the x argument as 10
sqrt(10)      # set the first argument as 10

# Some functions use more than one argument
  # FunctionName(argument1, argument2, argument3)

# There are required arguments and optional arguments;
# optional arguments have default values
  # FunctionName(required1, required2, optional3 = 10)

# Look at the documentation for rnorm()
?rnorm

# Goal: Return 20 random values from a normal distribution
# that has a mean of 0 and a standard deviation of 1
rnorm(n = 20, mean = 0, sd = 1)

# n is a required argument; a value must be provided
# mean is an optional argument; defaults to mean = 0
# sd is an optional argument; defaults to sd = 1
rnorm(n = 20)

# What if we don't supply a value for the n argument?
rnorm() # produces an error
## What does this error message tell you?

## Goal: Return 20 random values from a normal distribution
## that has a mean of 0 and a standard deviation of 6
rnorm(n = 20, mean = 0, sd = 6)

## Do these accomplish the same task?
rnorm(20, 0, 6)                 # Pros and cons?
rnorm(mean = 0, n = 20, sd = 6) # Pros and cons?
rnorm(n = 20, sd = 6)           # Pros and cons?

# - Nested Functions ----
# Functions are evaluated from the inside out
abs(6 - 14)
  # Step 1: 6-14 is evaluated to return -8
  # Step 2: abs(-8) is evaluated to return 8

# Goal: Find the square root of the absolute value of 6 - 14
sqrt(abs(6-14))

## Goal: Return 20 random values from a normal distribution
## that has a mean of 0 and a standard deviation of the
## square root of 23
rnorm(n = 20, mean = 0, sd = sqrt(23))

# Objects ----
# Objects ("containers", "boxes") store information
# in your current environment ("room", "desk")

# Some commonly used objects come "built in"
# You create other objects you want to be able to use later

# Goal: Find the value of the object called pi
pi

# Goal: Use pi to accomplish a task
pi * 10

# Goal: Create an object called x that contains the value 15
# Use the Assignment Operator <-
x <- 15

# Look at the contents of the object called x
x

# RULE: R is case sensitive
X            # returns an error

## Goal: Make an object called y that contains the value of x plus 3
y <- x + 3
y

# RULE: If you update x, y does not update automatically
x <- 150
x
y
# This is different from some programming languages that
# you may have experience with - be careful!

## Without running this code, what do you expect to get as output?
a <- 10
b <- 15
A <- 100
c <- a + b
b <- 50
c

# (a) 115 - no, R is case sensitive
# (b) 25 - correct
# (c) 150 - no, R is case sensitive and object values don't update when other objects are updated
# (d) 60 - no, object values don't update when other objects are updated

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
mynumber <- 13    # create an object
class(mynumber)   # what data class does the object contain?
sqrt(mynumber)

# Note: 'Numeric' actually includes two different types of numbers
# Integers: integer values
# Doubles: contain decimals
  # Depending on what functions you're using, sometimes
  # you'll see the terms 'numeric', 'integer' and 'double'
  # specified in different ways

# Character
myword <- "hello"   # create an object
class(myword)       # what data class does the object contain?
sqrt(myword)

# Logical
mytest <- TRUE      # create an object
class(mytest)       # what data class does the object contain?
sqrt(mytest)        # can you think of why this works?
sqrt(FALSE)         # Hint: why is this output different?

# Logical values can be "coerced" (forced to act) as numeric values
# TRUE becomes 1, FALSE becomes 0

# Other common data classes include Factors (categorical groupings) & a variety of Date/Datetime options
# Data Structures ----
# Objects can contain different structures of data
# Think of this as the shape or layout of the container that is used to hold an item

# - Scalars ----
# 1 element, 1 dimensional
pi
length(pi)

# - Vectors ----
# >1 element; 1 dimensional

# Example: Look at a built in object containing the alphabet
letters

# Note: [*] represents the position of each value in the vector

# Use : as a shortcut for vectors of integers
10:100     # returns the integers from 10 to 100, inclusive

# Goal: Put all integers from 4 to 11 into the object called myvector
myvector <- 4:11    # create object
myvector            # look at the contents of the object

# -- Vectors: Functions and Operators ----
# We learned that functions require specific data classes
# Different functions respond differently to data structure
sqrt(myvector)   # applied to each value in the vector
length(myvector) # applied to the entire vector
class(myvector)  # applied to the entire vector

# Conditional Operators
myvector > 5       # Each element is greater than 5
any(myvector > 5)  # Any element is greater than 5
all(myvector > 5)  # All elements are greater than 5

# a %in% b     "the scalar a is in the vector b"
15 %in% myvector   # "11 is in myvector"
"b" %in% letters   # "'b' is in letters"

# Creating customized vectors - Numeric

# Goal: Create a vector called myvalues that contains
# the numbers 1, 6, 3, 4, and 10
myvalues <- c(1, 6, 3, 4, 10) # "c" means "combine" into a vector
myvalues

## How many elements are in myvalues?
length(myvalues)

## Determine if 25 is found in myvalues
25 %in% myvalues

## What is the sum of myvalues?
sum(myvalues)

## Create a vector called aboutme that contains four elements:
  # The number of letters in your first name
  # The number of siblings you have
  # The number of pets you own
  # The first letter of your last name
aboutme <- c(8, 1, 2, "Q")
aboutme

# -- Vectors: Rules ----
class(myvalues) # Look at the class of data found in myvalues
class(aboutme)  # Look at the class of data found in aboutme

# Vectors are "atomic": they can only contain one class of data

# Implication: You can't mix data classes!
eggs <- c(3, 6, 10, "missing value", 12)
class(eggs)  # numeric values will be coerced into characters

# Goal: What is the total number of eggs?
sum(eggs)    # sum() must be used on numeric values

# Goal: Create a new object called numbereggs that contains
# the values from eggs, but forced to act as numeric values
numbereggs <- as.numeric(eggs)
numbereggs   # What do you notice?

# Goal: What is the total/average/minimum/maximum number of eggs?
sum(numbereggs)
mean(numbereggs)
min(numbereggs)
max(numbereggs)

# Missing values are represented by NA

# Goal: Calculate basic statistics while ignoring the NAs
mean(numbereggs, na.rm = TRUE)     # na.rm is an optional argument in several similar functions
min(numbereggs, na.rm = TRUE)
max(numbereggs, na.rm = TRUE)

# Goal: Assess which values are NAs
# A special function that acts like a conditional operator: is.na()
# is.na(x)    "x is NA"

# Each value of numbereggs is NA
numbereggs == NA     # doesn't work
is.na(numbereggs)       # works

# Each value of numbereggs is not NA
!is.na(numbereggs)   # works

# More complex functions and processes will often deal with
# missing values in a more reasonable way
# Example: visualizations, most statistical tests and models ignore NAs by default
