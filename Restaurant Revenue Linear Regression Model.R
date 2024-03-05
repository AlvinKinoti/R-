## setting the working directory
setwd("D:/Data Projects/My Projects/R")
getwd()

## Loading the dataset

df <- read.csv("D:/Data Projects/Practice Files/Restaurants Revenue Prediction/Restaurant_revenue (1).csv")
df

## Exploring the dataset

summary(df)

## Checking for null values
sum(is.na(df))

## Dealing with duplicates
df <- unique(df)

## Dealing with outliers in the dependent variable column 

# Checking for outliers
df$Monthly_Revenue[df$Monthly_Revenue %in% boxplot.stats(df$Monthly_Revenue)$out]

# Removing outliers

df <- df[! df$Monthly_Revenue %in% boxplot.stats(df$Monthly_Revenue)$out, ]
df

## Visualizing the dataset

library(ggplot2)
library(dplyr)
library(tidyverse)

View(df)

## Investigating the cuisine type with the most demand.

ggplot(df, aes(x = Cuisine_Type, y = Number_of_Customers))+
  geom_col( fill = "maroon")+
  labs(x= "Cuisine Type", y = "Customer Demand")+
  ggtitle("Customer Preference vs Cuisine Type")

## Checking the most frequent price paid by customers

ggplot(df, aes(x= Average_Customer_Spending))+
  geom_histogram(bins= 30, color = "black", fill = "red")+
  labs(x = "Average Price Paid by Customers")+
  ggtitle("Frequency of Average Price Paid by Customers")

## Relationship between Menu Price and Monthly Revenue

ggplot(df, aes(x = Menu_Price, y = Monthly_Revenue))+
  geom_point()+
  geom_smooth(method = "lm", se = F, color = "darkred")+
  labs(x = "Menu Price", y = "Monthly Revenue")+
  ggtitle("Relationship between Menu Price and Monthly Revenue")

## Building the Linear Regression Model
revenue <- df[-c(4)]
View(revenue)

plot(revenue)

### Splitting the data into training and testing sets
set.seed(2)
library(caTools)

split <- sample.split(revenue$Monthly_Revenue, SplitRatio = 0.7)
split

training_data <- subset(revenue, split == "True")
testing_data <- subset(revenue, split == "False")

### Creating the multiple linear model
multiple.regression <- lm(Monthly_Revenue ~ Number_of_Customers + Menu_Price + Marketing_Spend + 
                            Average_Customer_Spending + Promotions + Reviews, data = revenue)

summary(multiple.regression)


## Conclusion: The model is a good predictor of the monthly revenue.