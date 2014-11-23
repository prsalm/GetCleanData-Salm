# The "run_analysis.R" script creates the following variables:

        # Initial data load variables
                features: this data will be used for the column names for the combined X_train and X_test data
                X_testData: this is the data from the X_test.txt file
                y_testData: this is the data from the y_test.txt file
                subject_testData: this is the data from the subject_test.txt file
                X_trainData: this is the data from the X_train.txt file
                y_trainData: this is the data from the y_train.txt file
                subject_trainData: this is the data from the subject_train.txt file
        
        # Combined data set variables
                X_combined: combines X_testData and X_trainData 
                y_combined: combines y_testData and y_trainData 
                subject_combined: combines subject_testData and subject_trainData
                allCombined: combines X_combined, y_combined and subject_combined
                
        # Final data set for step 4
                onlyMeanAndStd: extracts only the mean and standard deviation measurements from allCombined
        
        
        
        
        
# The data in these files is initially extracted from the Samsung data which can be summarized as follows:

        These signals were used to estimate variables of the feature vector for each pattern:  
        '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
        
        tBodyAcc-XYZ
        tGravityAcc-XYZ
        tBodyAccJerk-XYZ
        tBodyGyro-XYZ
        tBodyGyroJerk-XYZ
        tBodyAccMag
        tGravityAccMag
        tBodyAccJerkMag
        tBodyGyroMag
        tBodyGyroJerkMag
        fBodyAcc-XYZ
        fBodyAccJerk-XYZ
        fBodyGyro-XYZ
        fBodyAccMag
        fBodyAccJerkMag
        fBodyGyroMag
        fBodyGyroJerkMag
        
        The set of variables that were estimated from these signals are: 
        
        mean(): Mean value
        std(): Standard deviation
        mad(): Median absolute deviation 
        max(): Largest value in array
        min(): Smallest value in array
        sma(): Signal magnitude area
        energy(): Energy measure. Sum of the squares divided by the number of values. 
        iqr(): Interquartile range 
        entropy(): Signal entropy
        arCoeff(): Autorregresion coefficients with Burg order equal to 4
        correlation(): correlation coefficient between two signals
        maxInds(): index of the frequency component with largest magnitude
        meanFreq(): Weighted average of the frequency components to obtain a mean frequency
        skewness(): skewness of the frequency domain signal 
        kurtosis(): kurtosis of the frequency domain signal 
        bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
        angle(): Angle between to vectors.
        
        Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
        
        gravityMean
        tBodyAccMean
        tBodyAccJerkMean
        tBodyGyroMean
        tBodyGyroJerkMean