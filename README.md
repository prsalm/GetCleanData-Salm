==================================
GetCleanData-Salm Dataset
Version 1.0
==================================
Phil Salm
P.Salm project repository for the Getting and Cleaning Data Course on Coursera
==================================

This "run_analysis.R" script was written for the course project of the "Getting and Cleaning Data" course on Coursera.
It requires the data.table library in order to function.
It also requires that the following data be downloaded, extracted, and set to the working directory.
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

There are five main tasks accomplished in this project.
        1. Merges the training and the test sets to create one data set.
        2. Extracts only the measurements on the mean and standard deviation for each measurement. 
        3. Uses descriptive activity names to name the activities in the data set
        4. Appropriately labels the data set with descriptive variable names. 
        5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for 
                each activity and each subject.
They are completed in the following order in this script.  (1), (3), (4), (2), (5)
Lastly, it generates a .txt file with the output from (5) for submission to the class.

The dataset includes the following files:
=========================================
- 'README.md'
- 'run_analysis.R': performs the analysis described above.
- 'CodeBook.md': provides a codebook for the variables created by the 'run_analysis.R' script.

License:
========
This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.