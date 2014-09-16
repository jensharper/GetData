The raw data for this project were obtained from the Human Activity Recognition Using Smartphones Data Set:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The following files were used to create "tidydataset.txt":
* features.txt (this file contains the variable names that were used to label the tidy dataset)
* activity_labels.txt (this file contains the definition of the numeric activity labels)
* y_text.txt (within the folder named 'test')
* X_test.txt (within the folder named 'test')
* subject_test.txt (within the folder named 'test')
* y_train.txt (within the folder named 'train')
* X_train.txt (within the folder named 'train')
* subject_train.txt (within the folder named 'train')

First, the test and train data were labeled and combined into a single dataset.
Then, the dataset was subsetted to contain only the mean and standard deviation measurements.
Then, the activity labels were changed from numeric (1-6) to strings, based on the contents of "activity_labels.txt".
Finally, the data were summarized by calculating the means of the subsetted variables for each subject and activity.

Data Dictionary for tidydataset.txt:
* subjectID: integers from 1 to 30, corresponding to the 30 volunteers within an age bracket of 19-48 years
* activity: one of six activities of daily living (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING)
* remaining columns: the mean of all mean and std measurements for each subject and activity

Note: The original dataset was normalized and bounded within [-1,1]; therefore, all of the means reported in tidydataset are unitless and bounded within [-1,1].

*****

The text below was provided with the original dataset (features_info.txt) to describe the variables and naming conventions:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.
