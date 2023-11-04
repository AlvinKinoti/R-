setwd("D:/Data Projects/Bounty Analytica/R")
getwd()

# Qn 1.	Create a numeric vector that repeats the sequence of all the even numbers
# between 1 to 30, with each number repeated thrice.

S <- seq(from = 2, to = 30, by = 2)
S
S_repeat <- rep(S, each = 3)
S_repeat

# Qn 2.	Create random numbers between 10 and 50. Use set.seed (50)
set.seed(50)
rd_nos <- c(10,50, set.seed(50))
rd_nos

# Qn 3.	Here are three practice questions related to matrices in R:
# Qn 4.	Create a 3x3 matrix in R that contains the numbers 1 through 9. 
# Then, calculate the determinant of the matrix.


mat <- matrix(c(1,2,3,4,5,6,7,8,9), nrow = 3, ncol=3, byrow = T)
mat

dmat <- det(mat)
print(dmat)

# Qn 5.	Create a 2x2 matrix in R that contains the numbers 2, 4, 6, and 8.
# Then, multiply the matrix by itself and print the result.
rownames = c("row1", "row2")
colnames = c("col1", "col2")

mat1 <- matrix(c(2,4,6,8), nrow=2,ncol=2, byrow=T, dimnames = list(rownames, colnames))
print(mat1)

mat1_squared = mat1*mat1
print(mat1_squared)

# Qn 6.	Investigate the "diamonds" dataset to determine the most expensive diamond and its associated price.
library(ggplot2)
View(diamonds)
attach(diamonds)

diamonds_sorted <- diamonds[order(-price), ]
print(diamonds_sorted)


# Qn 7.	Using the "mtcars" dataset in R, create a data frame that only includes the 
# columns "mpg", "cyl", and "wt". Then, sort the data frame by "mpg" in descending order.

library(ggplot2)
attach(mtcars)
View(mtcars)

df <- subset(mtcars, select = c(mpg,cyl,wt)) 
df

df_sorted <- df[order(-mpg), ]
df_sorted