
## load all data
        # load key data from files
                activity_labels <- read.table("activity_labels.txt")
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
        # set column names
                names(X_combined) <- features[,2]
                names(y_combined) <- c("activities")
                names(subject_combined) <- c("subjects")
                
        # replace y values with activity names
                
        # add y and subject values as columns to X
                
        # select measurements on the mean and std for each measure
                
## Create second data set with avg of each variable for each activity
## and each subject
                