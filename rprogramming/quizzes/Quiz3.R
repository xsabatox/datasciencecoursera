## R Programming - Quiz 03


## Question 01
## Take a look at the 'iris' dataset that comes with R. The data can be loaded with the code:
library(datasets)
data(iris)
## There will be an object called 'iris' in your workspace. A description of the dataset can be found by running:
?iris
## In this dataset, what is the mean of 'Sepal.Length' for the species virginica? (Please only enter the numeric result and nothing else.)
names(iris)
mean(iris$Sepal.Length[iris$Species == "virginica"])
## A: 6.588


## Question 02
## Continuing with the 'iris' dataset from the previous Question, what R code returns a vector of the means of the variables 'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width'?
colMeans(iris[ , 1:4])
apply(iris[ , 1:4], 2, mean)
## A: apply(iris[ , 1:4], 2, mean)


## Question 03
## Load the 'mtcars' dataset in R with the following code
library(datasets)
data(mtcars)
## There will be an object names 'mtcars' in your workspace. You can find some information about the dataset by running:
?mtcars
## How can one calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)?
tapply(mtcars$mpg, mtcars$cyl, mean)
with(mtcars, tapply(mpg, cyl, mean))
## A: with(mtcars, tapply(mpg, cyl, mean))


## Question 04
## Continuing with the 'mtcars' dataset from the previous Question, what is the absolute difference between the average horsepower of 4-cylinder cars and the average horsepower of 8-cylinder cars?
mean.4cyl <- mean(mtcars$hp[mtcars$cyl == 4])
mean.8cyl <- mean(mtcars$hp[mtcars$cyl == 8])
abs(mean.4cyl - mean.8cyl)
## A: 126.5779


## Question 05
## If you run
debug(ls)
## what happens when you next call the 'ls' function?
## A: Execution of 'ls' will suspend at the beginning of the function and you will be in the browser.