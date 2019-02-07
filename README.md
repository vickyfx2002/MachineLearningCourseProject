# Practical Machine Learning Course Project 
## The data for this project is from http://groupware.les.inf.puc-rio.br/har 

We download the training data from 

https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv 

We build the model to predict the test data from the link below

https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv

I did the following:
1. I downloaded the cvs files from the web, and then read them into R. 
2. I found many of the variables (columns) have NAs or blank values, so I removed these variables 
from both the training and testing data. 
3. I found the first column ("X") from the training data is just the row (observation) index, so 
I deleted this column. Similarly, I found the last column ("problem_id") from the testing data is
just the testing observation index, so I deleted it from the testing data. 
4. I used two methods, i.e., "lda" and "rpart" with 10-cross validation to build the models. 
"lda" method got an accuracy of 0.8551, while "rpart" method got an accuracy of 0.5057. 

Note that the R code is also uploaded here. 
