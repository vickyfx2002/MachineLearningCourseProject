## set a random seed 
set.seed(42);

## download the csv files to the current wd
download.file("https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv", destfile = "training.csv", method = "curl")
download.file("https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv", destfile = "testing.csv", method = "curl")

## read the csv data into R
training<-read.csv("training.csv",stringsAsFactors = FALSE);
testing <- read.csv("testing.csv",stringsAsFactors = FALSE);

## remove the columns (variables) with two many NAs or blanks from testing and training data
colna <- which(colSums(is.na(training)) > 0.5*nrow(training)| colSums(training=="")> 0.5*nrow(training));
trainingclean <- training[,-colna];
testingclean<-testing[,-colna];

## remove the first column "X" which is simply the  observation No. from training and testing sets.
trainingclean <- trainingclean[,-1]
testingclean <-testingclean[,-1];

## remove the last column "problem_id" from the testing data. 
testingclean <- testingclean[,-59];


## Method 1: use 10-fold cross validation and "lda" method to train the training data .
modcvlda<-train(classe~., method="lda", data=trainingclean, 
             trControl=trainControl(method="cv", number=10, 
                                    verboseIter = TRUE));

## print out the model, and got the model accuracy is 0.8551
print(modcvlda)

## use the model to predict the testing data. 
predcvlda <- predict(modcvlda,testingclean);
print(predcvlda)
## The predicted values for the testing data is [1] B B B A A E D C A A B C B A E E A B B B

## Method 2: use 10-fold cross validation and "rpart" method to train the training data .
modcvrpart<-train(classe~., method="rpart", data=trainingclean, 
                trControl=trainControl(method="cv", number=10, 
                                       verboseIter = TRUE));

## print out the model, and got the model accuracy is 0.5057
print(modcvrpart)

## use the model to predict the testing data. 
predcvrpart <- predict(modcvrpart,testingclean);
print(predcvrpart)
## the predicted values are  [1] B A C A C C C C A A C C C A C C C B B C
                             
