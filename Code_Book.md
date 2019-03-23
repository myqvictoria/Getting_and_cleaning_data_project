# Code Book
This is the introduction for this repository's script and datasets.

## Code Introduction:
This code's main purpose is to tidy the datasets in the giving "UCI HAR Dataset". Here are the steps:
* First, downloading the files and creating dir "UCI HAR Dataset" to cover the files
* Second, reading the datasets in R, meanwhile, using the giving features to set the names of the datasets' measurment variables.
* Third, using rbind() to merge the train and test dataset.
* Fourth, correcting the variable names of the identifier variables by using names().
* Fifth, using grep() to extract the variables contaning mean or standard deviation。
* Sixth, using the melt() and dcast() in data.table package to tidy the datasets as required.

# Code Book
This is the introduction for this repository's script and datasets.

## Code Introduction:
This code's main purpose is to tidy the datasets in the giving "UCI HAR Dataset". Here are the steps:
* First, downloading the files and creating dir "UCI HAR Dataset" to cover the files
Second, reading the datasets in R, meanwhile, using the giving features to set the names of the datasets' measurement variables.
* Third, using rbind() to merge the train and test dataset.
* Fourth, correcting the variable names of the identifier variables by using names().
* Fifth, using grep() to extract the variables containing mean or standard deviation。
* Sixth, using the melt() and dcast() in data.table package to tidy the datasets as required.

## Data Introduction:

### Identifier variables:
* Sport_Type
* Subject_Vonlunteer

### Measurement variables:
* tBodyAcc.mean...X
* tBodyAcc.mean...Y
* tBodyAcc.mean...Z
* tBodyAcc.std...X
* tBodyAcc.std...Y
* tBodyAcc.std...Z
* tGravityAcc.mean...X
* tGravityAcc.mean...Y
* tGravityAcc.mean...Z
* tGravityAcc.std...X
* tGravityAcc.std...Y
* tGravityAcc.std...Z
* tBodyAccJerk.mean...X
* tBodyAccJerk.mean...Y
* tBodyAccJerk.mean...Z
* tBodyAccJerk.std...X
* tBodyAccJerk.std...Y
* tBodyAccJerk.std...Z
* tBodyGyro.mean...X
* tBodyGyro.mean...Y
* tBodyGyro.mean...Z
* tBodyGyro.std...X
* tBodyGyro.std...Y
* tBodyGyro.std...Z
* tBodyGyroJerk.mean...X
* tBodyGyroJerk.mean...Y
* tBodyGyroJerk.mean...Z
* tBodyGyroJerk.std...X
* tBodyGyroJerk.std...Y
* tBodyGyroJerk.std...Z
* tBodyAccMag.mean..
* tBodyAccMag.std..
* tGravityAccMag.mean..
* tGravityAccMag.std..
* tBodyAccJerkMag.mean..
* tBodyAccJerkMag.std..
* tBodyGyroMag.mean..
* tBodyGyroMag.std..
* tBodyGyroJerkMag.mean..
* tBodyGyroJerkMag.std..
* fBodyAcc.mean...X
* fBodyAcc.mean...Y
* fBodyAcc.mean...Z
* fBodyAcc.std...X
* fBodyAcc.std...Y
* fBodyAcc.std...Z
* fBodyAcc.meanFreq...X
* fBodyAcc.meanFreq...Y
* fBodyAcc.meanFreq...Z
* fBodyAccJerk.mean...X
* fBodyAccJerk.mean...Y
* fBodyAccJerk.mean...Z
* fBodyAccJerk.std...X
* fBodyAccJerk.std...Y
* fBodyAccJerk.std...Z
* fBodyAccJerk.meanFreq...X
* fBodyAccJerk.meanFreq...Y
* fBodyAccJerk.meanFreq...Z
* fBodyGyro.mean...X
* fBodyGyro.mean...Y
* fBodyGyro.mean...Z
* fBodyGyro.std...X
* fBodyGyro.std...Y
* fBodyGyro.std...Z
* fBodyGyro.meanFreq...X
* fBodyGyro.meanFreq...Y
* fBodyGyro.meanFreq...Z
* fBodyAccMag.mean..
* fBodyAccMag.std..
* fBodyAccMag.meanFreq..
* fBodyBodyAccJerkMag.mean..
* fBodyBodyAccJerkMag.std..
* fBodyBodyAccJerkMag.meanFreq..
* fBodyBodyGyroMag.mean..
* fBodyBodyGyroMag.std..
* fBodyBodyGyroMag.meanFreq..
* fBodyBodyGyroJerkMag.mean..
* fBodyBodyGyroJerkMag.std..
* fBodyBodyGyroJerkMag.meanFreq.."
