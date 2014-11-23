## This script was written for the course project of the "Getting and Cleaning Data" course on Coursera.
## It requires the data.table library in order to function.
## It also requires that the following data be downloaded, extracted, and set to the working directory.
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## There are five main components to this project.
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for 
##    each activity and each subject.
## They are completed in the following order in this script.  (1), (3), (4), (2), (5)
## Lastly, it generates a .txt file with the output from (5) for submission to the class.

## load all data
        # load key data from files
               # activity_labels <- read.table("activity_labels.txt")
                features <- read.table("features.txt")
        # load test data from files
                X_testData <- read.table("./test/X_test.txt")
                y_testData <- read.table("./test/y_test.txt")
                subject_testData <- read.table("./test/subject_test.txt")
        # load train data from files
                X_trainData <- read.table("./train/X_train.txt")
                y_trainData <- read.table("./train/y_train.txt")
                subject_trainData <- read.table("./train/subject_train.txt")
                
## Combine Test and Train files
        # combine X files
                X_combined <- rbind(X_testData,X_trainData)
        # combine y files
                y_combined <- rbind(y_testData,y_trainData)
        # combine subject files
                subject_combined <- rbind(subject_testData,subject_trainData)
                
## Shape first data set
        # replace y values with activity names
               for (i in 1:10299){
                        if (y_combined[i,1]==1){y_combined[i,1]<-"Walking"}
                        else if (y_combined[i,1]==2){y_combined[i,1]<-"Walking_Upstairs"}
                        else if (y_combined[i,1]==3){y_combined[i,1]<-"Walking_Downstairs"}
                        else if (y_combined[i,1]==4){y_combined[i,1]<-"Sitting"}
                        else if (y_combined[i,1]==5){y_combined[i,1]<-"Standing"}
                        else if (y_combined[i,1]==6){y_combined[i,1]<-"Laying"}
                        }
                
        # set column names
                names(X_combined) <- features[,2]
                names(y_combined) <- c("activities")
                names(subject_combined) <- c("subjects")
                
        # add y and subject values as columns to X
                allCombined <- cbind(X_combined,y_combined,subject_combined)
                
        # select measurements on the mean and std for each measure
        # note: kept subjects and activities columns as well since they are required for last step
              onlyMeanAndStd <- data.table("subjects"=allCombined[,"subjects"],
                                           "activities"=allCombined[,"activities"],
                                           "tBodyAcc-mean()-X"=allCombined[,"tBodyAcc-mean()-X"],
                                      "tBodyAcc-mean()-Y"=allCombined[,"tBodyAcc-mean()-Y"],
                                      "tBodyAcc-mean()-Z"=allCombined[,"tBodyAcc-mean()-Z"],
                                      "tGravityAcc-mean()-X"=allCombined[,"tGravityAcc-mean()-X"],
                                      "tGravityAcc-mean()-Y"=allCombined[,"tGravityAcc-mean()-Y"],
                                      "tGravityAcc-mean()-Z"=allCombined[,"tGravityAcc-mean()-Z"],
                                      "tBodyAccJerk-mean()-X"=allCombined[,"tBodyAccJerk-mean()-X"],
                                      "tBodyAccJerk-mean()-Y"=allCombined[,"tBodyAccJerk-mean()-Y"],
                                      "tBodyAccJerk-mean()-Z"=allCombined[,"tBodyAccJerk-mean()-Z"],
                                      "tBodyGyro-mean()-X"=allCombined[,"tBodyGyro-mean()-X"],
                                      "tBodyGyro-mean()-Y"=allCombined[,"tBodyGyro-mean()-Y"],
                                      "tBodyGyro-mean()-Z"=allCombined[,"tBodyGyro-mean()-Z"],
                                      "tBodyGyroJerk-mean()-X"=allCombined[,"tBodyGyroJerk-mean()-X"],
                                      "tBodyGyroJerk-mean()-Y"=allCombined[,"tBodyGyroJerk-mean()-Y"],
                                      "tBodyGyroJerk-mean()-Z"=allCombined[,"tBodyGyroJerk-mean()-Z"],
                                      "tBodyAccMag-mean()"=allCombined[,"tBodyAccMag-mean()"],
                                      "tGravityAccMag-mean()"=allCombined[,"tGravityAccMag-mean()"],
                                      "tBodyAccJerkMag-mean()"=allCombined[,"tBodyAccJerkMag-mean()"],
                                      "tBodyGyroMag-mean()"=allCombined[,"tBodyGyroMag-mean()"],
                                      "tBodyGyroJerkMag-mean()"=allCombined[,"tBodyGyroJerkMag-mean()"],
                                      "fBodyAcc-mean()-X"=allCombined[,"fBodyAcc-mean()-X"],
                                      "fBodyAcc-mean()-Y"=allCombined[,"fBodyAcc-mean()-Y"],
                                      "fBodyAcc-mean()-Z"=allCombined[,"fBodyAcc-mean()-Z"],
                                      "fBodyAccJerk-mean()-X"=allCombined[,"fBodyAccJerk-mean()-X"],
                                      "fBodyAccJerk-mean()-Y"=allCombined[,"fBodyAccJerk-mean()-Y"],
                                      "fBodyAccJerk-mean()-Z"=allCombined[,"fBodyAccJerk-mean()-Z"],
                                      "fBodyGyro-mean()-X"=allCombined[,"fBodyGyro-mean()-X"],
                                      "fBodyGyro-mean()-Y"=allCombined[,"fBodyGyro-mean()-Y"],
                                      "fBodyGyro-mean()-Z"=allCombined[,"fBodyGyro-mean()-Z"],
                                      "fBodyAccMag-mean()"=allCombined[,"fBodyAccMag-mean()"],
                                      "fBodyBodyAccJerkMag-mean()"=allCombined[,"fBodyBodyAccJerkMag-mean()"],
                                      "fBodyBodyGyroMag-mean()"=allCombined[,"fBodyBodyGyroMag-mean()"],
                                      "fBodyBodyGyroJerkMag-mean()"=allCombined[,"fBodyBodyGyroJerkMag-mean()"],
                                      "tBodyAcc-std()-X"=allCombined[,"tBodyAcc-std()-X"],
                                      "tBodyAcc-std()-Y"=allCombined[,"tBodyAcc-std()-Y"],
                                      "tBodyAcc-std()-Z"=allCombined[,"tBodyAcc-std()-Z"],
                                      "tGravityAcc-std()-X"=allCombined[,"tGravityAcc-std()-X"],
                                      "tGravityAcc-std()-Y"=allCombined[,"tGravityAcc-std()-Y"],
                                      "tGravityAcc-std()-Z"=allCombined[,"tGravityAcc-std()-Z"],
                                      "tBodyAccJerk-std()-X"=allCombined[,"tBodyAccJerk-std()-X"],
                                      "tBodyAccJerk-std()-Y"=allCombined[,"tBodyAccJerk-std()-Y"],
                                      "tBodyAccJerk-std()-Z"=allCombined[,"tBodyAccJerk-std()-Z"],
                                      "tBodyGyro-std()-X"=allCombined[,"tBodyGyro-std()-X"],
                                      "tBodyGyro-std()-Y"=allCombined[,"tBodyGyro-std()-Y"],
                                      "tBodyGyro-std()-Z"=allCombined[,"tBodyGyro-std()-Z"],
                                      "tBodyGyroJerk-std()-X"=allCombined[,"tBodyGyroJerk-std()-X"],
                                      "tBodyGyroJerk-std()-Y"=allCombined[,"tBodyGyroJerk-std()-Y"],
                                      "tBodyGyroJerk-std()-Z"=allCombined[,"tBodyGyroJerk-std()-Z"],
                                      "tBodyAccMag-std()"=allCombined[,"tBodyAccMag-std()"],
                                      "tGravityAccMag-std()"=allCombined[,"tGravityAccMag-std()"],
                                      "tBodyAccJerkMag-std()"=allCombined[,"tBodyAccJerkMag-std()"],
                                      "tBodyGyroMag-std()"=allCombined[,"tBodyGyroMag-std()"],
                                      "tBodyGyroJerkMag-std()"=allCombined[,"tBodyGyroJerkMag-std()"],
                                      "fBodyAcc-std()-X"=allCombined[,"fBodyAcc-std()-X"],
                                      "fBodyAcc-std()-Y"=allCombined[,"fBodyAcc-std()-Y"],
                                      "fBodyAcc-std()-Z"=allCombined[,"fBodyAcc-std()-Z"],
                                      "fBodyAccJerk-std()-X"=allCombined[,"fBodyAccJerk-std()-X"],
                                      "fBodyAccJerk-std()-Y"=allCombined[,"fBodyAccJerk-std()-Y"],
                                      "fBodyAccJerk-std()-Z"=allCombined[,"fBodyAccJerk-std()-Z"],
                                      "fBodyGyro-std()-X"=allCombined[,"fBodyGyro-std()-X"],
                                      "fBodyGyro-std()-Y"=allCombined[,"fBodyGyro-std()-Y"],
                                      "fBodyGyro-std()-Z"=allCombined[,"fBodyGyro-std()-Z"],
                                      "fBodyAccMag-std()"=allCombined[,"fBodyAccMag-std()"],
                                      "fBodyBodyAccJerkMag-std()"=allCombined[,"fBodyBodyAccJerkMag-std()"],
                                      "fBodyBodyGyroMag-std()"=allCombined[,"fBodyBodyGyroMag-std()"],
                                      "fBodyBodyGyroJerkMag-std()"=allCombined[,"fBodyBodyGyroJerkMag-std()"])  

## Create second data set with avg of each variable for each activity and each subject

                

## Write text file
                
                