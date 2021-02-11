# 1. Define a factor variables which holds 4 different cities of Turkey, then add two different city names as
# additional levels of the factor variable.
# 2. Create suitable variables and assign them your name, surname, date of birth, and age.
# 3. Check data types of the variables created in Q2 with the proper functions (Functions must always
#                                                                               return TRUE).
# 4. Install the "caret" package. Then add it to your R file as a library. Choose a function inside the
# package with using Help. Finally, write the name of the function.
# 5. Print out the path of your working directory. Then change your working directory to the location of
# your Desktop.
# 6. Create four random numbers by using runif() function (Please use the Help to get more information
#                                                          about the usage of the function). Please note that all numbers after the comma must be rounded.
# 7. Create a numeric vector includes the numbers "NA, NA, 100, 3, NA, 9000, 25, 300, 789, NA", respectively, and answer the questions below:
#   . print the third element of the vector.
# . compute the sum of the first three elements of the vector.
# . assign the numbers created in Q6 (as a number, not a string) instead of NA elements, respectively.
# . find the variance and the standard deviation of the vector.
# 8. Create the subsets of the vector v1=c(30, 0, 45, 800, 500, 40, 250, 260, 798, 1000, 20) by using the
# correct logical statements, and assign each of them to a different object:
#   . elements greater than 50.
# . elements between 200 and 300.
# . elements
# . elements not equal to 798
# 9. Write an R code that creates two vectors which hold even and odd numbers between 1 and 10000,
# respectively. Then compute the squares of v1 and v2. Assign sum of two vectors as a different vector
# named "toplam".
# 10. index_val <- c(2, 5, 6) and myNumbers <- c(213, 652, 126, 268, 387, 14, 383, 870, 341, 483) are given.
# Print the results of the followings and assign them to different objects. Compute the sum of their
# lengths.
# . myNumbers[index_val]
# . myNumbers[-index_val]




install.packages("lubridate")
library(lubridate)

#Q1
cities <- c("Istanbul","Izmir","Ankara","Konya")
city_f <- factor(cities)
fctrvar2 <- factor(city_f,levels = c ("Istanbul","Izmir","Ankara","Konya","Gobeklitepe","Cappadocia"))

#Q2
name <- "Hasan"
lname <- "Ijaz"
d.o.b <- as.Date("1999-07-15")
age <- 20L

#Q3
is.character(name)
is.character(lname)
is.Date(d.o.b)
is.integer(age)

#Q4
install.packages("caret")
library(caret)
ggplot()

#Q5
(getwd())
setwd("C:/Users/H B/Desktop")

#Q6
num1 = round(runif(1,0,100),0)
num2 = round(runif(1,0,100),0)
num3 = round(runif(1,0,100),0)
num4 = round(runif(1,0,100),0)

#Q7
vec <- c(NA, NA, 100, 3, NA, 9000, 25, 300, 789, NA)
vec[3]
sum(vec[1:3],na.rm=TRUE)
vec[1]<- num1
vec[2]<- num2
vec[5]<- num3
vec[10]<- num4
var(vec)
sd(vec)

#Q8
v1 <- c(30, 0, 45, 800, 500, 40, 250, 260, 798, 1000, 20)
v2<- v1[v1>50]
v3<- v1[v1>100 & v1<200]
v4<-v1
v5<-v1[v1!=798]

#Q9
v1 <- seq(1,10000,2)
v2 <- seq(2,10000,2)
v1 <- v1^2
v2 <- v2^2
toplam <- (v1 + v2)

#Q10
index_val <- c(2, 5, 6)
myNumbers <- c(213, 652, 126, 268, 387, 14, 383, 870, 341, 483)
a<- myNumbers[index_val]
b<- myNumbers[-index_val]
len_sum<-length(a)+length(b)

