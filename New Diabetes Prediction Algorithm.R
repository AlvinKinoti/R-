setwd("D:/Data Projects/My Projects/R")

# 1. Load the libraries and the dataset

library(ggplot2)
library(dplyr)
library(tidyverse)

library(caTools)

data <- read.csv("D:/Data Projects/Practice Files/Diabetes Dataset/diabetes.csv")
data

data <- na.omit(data)

#2. split the dataste into testing and training

split <- sample.split(data, SplitRatio = 0.8)
split

training <- subset(data, split == TRUE)
testing <- subset(data, split == FALSE)

#3. Buidling the model

model <- glm(Outcome~., training, family = "binomial")
summary(model)

# 4.checking the influence of non significant i..v on the model

model <- glm(Outcome~.-SkinThickness, training, family = "binomial")
summary(model)

## SkinThickness is not a signifiant variable in the model. (Because AIC and Residual Devance 
## have decreased after removing it)

model <- glm(Outcome~.-Insulin, training, family = "binomial")
summary(model)

## Insulin is a signifiant variable in the model. (Because AIC and Residual Devance 
## have increased after removing it)

model <- glm(Outcome~.-Age, training, family = "binomial")
summary(model)

## Age is a signifiant variable in the model. (Because AIC and Residual Devance 
## have increased after removing it)

# 5. Predicting the values for the dataset

res <- predict(model, testing, type = "response")
res

# 6. Creating the Confusion Matrix to find the accuracy of the model
table(Actual_Value = testing$Outcome, Predicted_Value = res>0.5)
table

## Finding the Accuracy 
(106+30) / (106+13+22+30) 

# Calculating the threshold
res <- predict(model, training, type = "response")

library(ROCR)
ROCRPred <- prediction(res, training$Outcome)
ROCRPerf <- performance(ROCRPred, "tpr", "fpr")

plot(ROCRPerf, colorize=TRUE, print.cutoffs.at=seq(0.1, by=0.1))

## from the graph, the correct threshold should be 0.3

## checking the threshold with the confusion matrix.

res <- predict(model, testing, type = "response")

table(Actual_Value = testing$Outcome, Predicted_Value = res>0.5)
table

# checking the actual model accuracy using the 0.3 threshold from the graph
table(Actual_Value = testing$Outcome, Predicted_Value = res>0.3)
table

(86 + 42)/ (86+33+10+42)

# The model has an accuracy of 74% making it a good predictor of diabetes.