CodeBook.md

# Data Processing
Data processing is done by using the functions in run_analysis.R. 

##Primary Function
Run this function on its own at the RStudio command prompt after sourcing run_analysis.R
*mergedata() # merges the test and train, X and y, datasets into one, and runs the Helper Functions

##Helper Functions
*getmean_std() # extract the means and standarad deviation measures from the original data
*name_activity() # convert original activity data from integer to descriptive string
*getcol_labels() # attach the column labels from the features.txt file, and our own subject and activity labels 
*summary_means ()  # generate a summary of means on the extracted data, and write to subject_activity_means.csv

# Data
## Original Data
The original data is borrowed from Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto, at Smartlab Universitad degli Studi di Genova, Italy, who studied Human Activity Recognition Using Smartphones.
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The original dataset, upon which run_analysis.R operates, is located in the dataset/ subdirectory

A full description of the study can be found at
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## Modified Data
The data output by running the mergedata() function after sourcing run_analysis.R, is a summary of means on a subset of means and standard deviation measures extracted from the original dataset, for each of 30 subjects in the study, on six experimental activities, across a range of 3-axial linear acceleration and 3-axial angular velocities produced by the accelerometer and gyroscope in a Samsung Galaxy S II warn by each subject.

###Activities
Numbers correspond to the original values given to the six activites, replaced in the modified data with the text description for each activity.
*1 = WALKING 
*2 = WALKING_UPSTAIRS 
*3 = WALKING_DOWNSTAIRS 
*4 = SITTING 
*5 = STANDING 
*6 = LAYING

### Variables
The 88 variables made up of means and standard deviations from the original 561 variables, for each subject on each activity

subject
activity
tBodyAcc-mean()-X
tBodyAcc-mean()-Y
tBodyAcc-mean()-Z
tBodyAcc-std()-X
tBodyAcc-std()-Y
tBodyAcc-std()-Z
tGravityAcc-mean()-X
tGravityAcc-mean()-Y
tGravityAcc-mean()-Z
tGravityAcc-std()-X
tGravityAcc-std()-Y
tGravityAcc-std()-Z
tBodyAccJerk-mean()-X
tBodyAccJerk-mean()-Y
tBodyAccJerk-mean()-Z
tBodyAccJerk-std()-X
tBodyAccJerk-std()-Y
tBodyAccJerk-std()-Z
tBodyGyro-mean()-X
tBodyGyro-mean()-Y
tBodyGyro-mean()-Z
tBodyGyro-std()-X
tBodyGyro-std()-Y
tBodyGyro-std()-Z
tBodyGyroJerk-mean()-X
tBodyGyroJerk-mean()-Y
tBodyGyroJerk-mean()-Z
tBodyGyroJerk-std()-X
tBodyGyroJerk-std()-Y
tBodyGyroJerk-std()-Z
tBodyAccMag-mean()
tBodyAccMag-std()
tGravityAccMag-mean()
tGravityAccMag-std()
tBodyAccJerkMag-mean()
tBodyAccJerkMag-std()
tBodyGyroMag-mean()
tBodyGyroMag-std()
tBodyGyroJerkMag-mean()
tBodyGyroJerkMag-std()
fBodyAcc-mean()-X
fBodyAcc-mean()-Y
fBodyAcc-mean()-Z
fBodyAcc-std()-X
fBodyAcc-std()-Y
fBodyAcc-std()-Z
fBodyAcc-meanFreq()-X
fBodyAcc-meanFreq()-Y
fBodyAcc-meanFreq()-Z
fBodyAccJerk-mean()-X
fBodyAccJerk-mean()-Y
fBodyAccJerk-mean()-Z
fBodyAccJerk-std()-X
fBodyAccJerk-std()-Y
fBodyAccJerk-std()-Z
fBodyAccJerk-meanFreq()-X
fBodyAccJerk-meanFreq()-Y
fBodyAccJerk-meanFreq()-Z
fBodyGyro-mean()-X
fBodyGyro-mean()-Y
fBodyGyro-mean()-Z
fBodyGyro-std()-X
fBodyGyro-std()-Y
fBodyGyro-std()-Z
fBodyGyro-meanFreq()-X
fBodyGyro-meanFreq()-Y
fBodyGyro-meanFreq()-Z
fBodyAccMag-mean()
fBodyAccMag-std()
fBodyAccMag-meanFreq()
fBodyBodyAccJerkMag-mean()
fBodyBodyAccJerkMag-std()
fBodyBodyAccJerkMag-meanFreq()
fBodyBodyGyroMag-mean()
fBodyBodyGyroMag-std()
fBodyBodyGyroMag-meanFreq()
fBodyBodyGyroJerkMag-mean()
fBodyBodyGyroJerkMag-std()
fBodyBodyGyroJerkMag-meanFreq()
angle(tBodyAccMean,gravity)
angle(tBodyAccJerkMean),gravityMean)
angle(tBodyGyroMean,gravityMean)
angle(tBodyGyroJerkMean,gravityMean)
angle(X,gravityMean)
angle(Y,gravityMean)
angle(Z,gravityMean)


### Sample Output
    > head(summaryData[, 1:5], n=3)
       subject activity tBodyAcc-mean()-X tBodyAcc-mean()-Y tBodyAcc-mean()-Z
    1        1   LAYING         0.2725749       -0.01631775        -0.1071601
    31       1  SITTING         0.2768757       -0.01452205        -0.1044127
    61       1 STANDING         0.2789713       -0.01762506        -0.1076845


