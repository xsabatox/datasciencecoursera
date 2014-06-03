## R Programming - Quiz 01


## Question 01
## The R language is a dialect of which of the following programming languages?
## A: R is a dialect of S language.


## Question 02
## The definition of free software consists of four freedoms (freedoms 0 through 3). Which of the following is NOT one of the freedoms that are part of the definition?
## A: The freedom to sell the software for any price.


## Question 03
## In R the following are all atomic data types EXCEPT
## A: Array.


## Question 04
## If I execute the expression x <- 4L in R, what is the class of the object `x' as determined by the `class()' function?
x <- 4L
class(x)
## A: Integer.


## Question 05
## What is the class of the object defined by x <- c(4, TRUE)?
x <- c(4, TRUE)
class(x)
## A: Numeric.


## Question 06
## If I have two vectors x <- c(1,3, 5) and y <- c(3, 2, 10), what is produced by the expression cbind(x, y)?
x <- c(1, 3, 5)
y <- c(3, 2, 10)
z <- cbind(x, y)
print(z)
class(z)
## A: A 3 by 2 Matrix.


## Question 07
## A key property of vectors in R is that
## A: Elements of a vector all must be of the same class.


## Question 08
## Suppose I have a list defined as x <- list(2, "a", "b", TRUE). What does x[[1]] give me?
x <- list(2, "a", "b", TRUE)
y <- x[[ 1 ]]
print(y)
class(y)
## A numeric vector of length 1.


## Question 09
## Suppose I have a vector x <- 1:4 and a vector y <- 2. What is produced by the expression x + y?
x <- 1:4
y <- 2
z <- x + y
print(z)
class(z)
## A: A numeric vector with elements 3, 4, 5, 6.


## Question 10
## Suppose I have a vector x <- c(3, 5, 1, 10, 12, 6) and I want to set all elements of this vector that are less than 6 to be equal to zero. What R code achieves this?
x <- c(3, 5, 1, 10, 12, 6)
x[ x < 6 ] <- 0
print(x)
## A: x[ x < 6 ] <- 0


## Question 11
## In the dataset provided for this Quiz, what are the column names of the dataset?
hw1_data <- read.csv("~/Coursera/RProgramming/hw1_data.csv")
colnames(hw1_data)
## A: Ozone, Solar.R, Wind, Temp, Month, Day.


## Question 12
## Extract the first 2 rows of the data frame and print them to the console. What does the output look like?
hw1_data[ c(1, 2), ]
## A:
## Ozone Solar.R Wind Temp Month Day
## 1    41     190  7.4   67     5   1
## 2    36     118  8.0   72     5   2


## Question 13
## How many observations (i.e. rows) are in this data frame?
nrow(hw1_data)
## A: 153.


## Question 14
## Extract the last 2 rows of the data frame and print them to the console. What does the output look like?
hw1_data[ c(152, 153), ]
## A:
## Ozone Solar.R Wind Temp Month Day
## 152    18     131  8.0   76     9  29
## 153    20     223 11.5   68     9  30


## Question 15
## What is the value of Ozone in the 47th row?
hw1_data$Ozone[ 47 ]
## A: 21.


## Question 16
## How many missing values are in the Ozone column of this data frame?
sum(is.na(hw1_data$Ozone))
## A: 37.


## Question 17
## What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation.
ozone <- hw1_data$Ozone[ complete.cases(hw1_data$Ozone) ]
mean(ozone)
## A: 42.1.


## Question 18
## Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset?
subset1 <- hw1_data[ hw1_data$Ozone > 31 & hw1_data$Temp > 90, ]
mean(subset1$Solar.R, na.rm = TRUE)
## A: 212.8.


## Question 19
## What is the mean of "Temp" when "Month" is equal to 6? 
subset2 <- hw1_data[ hw1_data$Month == 6, ]
mean(subset2$Temp, na.rm = TRUE)
## A: 79.1.


## Question 20
## What was the maximum ozone value in the month of May (i.e. Month = 5)?
subset3 <- hw1_data[ hw1_data$Month == 5, ]
max(subset3$Ozone, na.rm = TRUE)
## A: 115.