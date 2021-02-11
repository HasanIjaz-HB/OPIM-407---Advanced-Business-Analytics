# 1. Read the Mall Customers dataset (https://www.kaggle.com/shwetabh123/mall-customers). According
# to Mall Customers dataset, perform the followings:
#   . transform the genre to a factor.
# . find the frequencies of the genre (Hint: table()).
# . change names of the last two columns as "income" and "spendingScore", respectively.
# . print "Age" and "income" of 12th observation.
# . print "Age" of the last 5 observations.
# . print the genre of the observations that are between 120th and 130th [120th,130th].
# . print "Age" of the observations which has income is between 15 and 100 [15, 100].
# . print "spendingScore" of the observations that are less than 20 or higher than 50.
# 2. Define a list by using the income of the first 20 observations and genre of the last ten observations of
# the Mall Customers dataset. Set column names of the list.
# 3. Create two different matrices (3x5 and 5x3) by using the spendingScore of the first 30 observations of
# the Mall Customers dataset. Then;
# . print the sum of the matrices.
# . perform matrix multiplication and print the result.
# . take the transpose of the two matrices and assign them to two variables.
# . bind the second matrix to the transpose of the first matrix by row.
# . bind the second matrix to the transpose of the first matrix by column.
# 4. Read the Iris dataset from the URL: https://archive.ics.uci.edu/ml/machine-learning-databases/iris/
#   iris.data. According to Iris dataset, perform the followings:
#   . Set column names by using "sepal_length", "sepal_width", "petal_length", "petal_width", "target_class".
# . transform the target_class to a factor.
# . save the dataset as RData file. Then write the R code that loads the dataset.
# . create the subset of the dataset in which sepal_width is between 2 and 3 [2, 3], or petal_width is
# greater than 1.
# 5. Create a user defined R function that takes the name for the months of the year, than prints out the
# index (from 1 to 12) of it by using switch.
# 6. Create a user defined R function that takes three different numbers, finds the maximum of them by
# using if-else if-else, and then returns the maximum.
# 1
# 7. Write the R code that prints the sepal_length of the observations' in Iris dataset, if the sepal_length
# is between 5 and 7 (Hints: [5, 7] for, if-else, next).
# 8. Write the R code that prints the sum of petal_width of the Iris-setosa observations' in Iris dataset
# (Hints: for, if-else, next).
# 9. Create a user defined R function of Q8.
# 10. Subset the first 50 observations by using while loop. Then, find the sum of sepal_length of Iris-virginica
# observations in the subset (Hints: Defining a variable for the sum and using break).




fileName <- "https://www.kaggle.com/shwetabh123/mall-customers?select=Mall_Customers.csv"
mall_customer_data <- read.table(file=fileName, header=TRUE, sep=".")
setwd("C:/Users/H B/Desktop")
data<-read.csv("Mall_Customers.csv")
head(data)

data$Genre <- as.factor(data$Genre)
table(data$Genre)

colnames(data)
names(data)[4]<-"income"
names(data)[5]<-"spendingScore"
data

data[12,c("Age","income")]

data[(nrow(data)-4):nrow(data),c("Age")]

data$Genre[120:130]

data[(data$income >=15) & (data$income <= 100),"Age"]

data[(data$spendingScore < 20) | (data$spendingScore > 50),"spendingScore"]

my_list <- list(data$income[1:20], data$Genre[(nrow(data)-9):nrow(data)])
my_list

names(my_list) <- c("income", "Genre")
my_list

my_vec <- data$spendingScore[1:30]
X <- matrix(my_vec[1:15], nrow=3, ncol = 5)
Y <- matrix(my_vec[26:30], nrow=5, ncol = 3)
X
Y

(X+Y)
(X %*% Y)
X_t <- t(X)
X_t
Y_t <- t(Y)
Y_t
Y_t <- rbind(X_t, X)
Y_t
Y_t <- rbind(X_t, Y)
Y_t


fileName <- "https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"
irisData <- read.table(file=fileName, header=TRUE, sep=",")
head(irisData)
colnames(irisData) <- c("sepal_length",
                        "sepal_width",
                        "petal_length",
                        "petal_width",
                        "target_class")

save(irisData, file = "iris_Data.RData")
load(file = "iris_Data.RData")

iris_Subset <- irisData[(irisData$sepal_width >= 2 & irisData$sepal_width <= 3) | (irisData$petal_width > 1),]
head(iris_Subset)


my_months <- function(month){
  switch(month,   
         "January" = (result <- 1),   
         "February" = (result <- 2),   
         "March" = (result <- 3),   
         "April" = (result <- 4), 
         "May" = (result <- 5), 
         "June" = (result <- 6),
         "July" = (result <- 7),
         "August" = (result <- 8),
         "September" = (result <- 9),
         "October" = (result <- 10),
         "November" = (result <- 11),
         "December" = (result <- 12),
         result <- "Please enter the correct name, and do not forget to capitalize the first letter !"
  ) 
  return(result)
}
my_months(month = "July")

find_max <- function(n1, n2, n3){
  max <- n1
  if(n2 > max)
    max <- n2
  else if(n3 > max)
    max <- n3
  else max
  
  return(max)
}

find_max(n1 = 5, n2 = 12, n3 = 3)

for(i in 1:nrow(irisData)){
  if(irisData$sepal_length[i] >= 5 & irisData$sepal_length[i] <= 7)
    print(irisData$sepal_length[i])
  else
    next
}

my_sum <- 0
for(i in 1:nrow(irisData)){
  my_sum <- my_sum + irisData$petal_width[i]
}
my_sum


sumScore <- function(){
  my_sum <- 0
  for(i in 1:nrow(irisData)){
    my_sum <- my_sum + irisData$petal_width[i]
  }
  return(my_sum)
}

sumScore()


my_sum <- 0
counter <- 1
subset_ex <-c(0,0,0,0,0)


while(counter <= 50 ){
  subset_ex<- rbind(subset_ex,irisData[counter,1])
  my_sum <- my_sum + irisData$sepal_length[counter]
  counter <- counter + 1
}
my_sum

