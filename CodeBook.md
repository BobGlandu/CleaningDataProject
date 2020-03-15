
---
title: "CodeBook"
author: "Matt"
date: "3/15/2020"
output: html_document
---



## Variables

The script *run_analysis.r* produces two sets *complete_set* and *activity_summary* that both include the following variables: 

1. Activity 

2. Measurements: standard deviation and mean of measurements in the time domain and frequency domain for
    * Body Acceleration
    * Gravity Acceleration
    * Body Acceleration Jerk
    * Body Gyroscope
    * Body Gyroscope Jerk
    * Body Acceleration Magnitude
    * Gravity Acceleration Magnitude
    * Body Acceleration Jerk Magnitude
    * Body Gyroscope Magnitude
    * Body Gyroscope Jerk Magnitude
  
### 1. Activity

* Represents the physical activity of the subject during measurement.
* This a factor with the following possible values:

WALKING

WALKING_UPSTAIRS

WALKING_DOWNSTAIRS

SITTING

STANDING

LAYING


### 2. Measurements 

* All variables starting with the letter 't' are in the time domain
* All variables starting with the letter 'f' are in the frequency domain
* There is one pair of variables for each measurement
  - std: standard deviation
  - mean: mean
* All variables are of type numeric 
* Units: all values are normalised and bounded to [-1, 1]   


**Body Acceleration**

tBodyAcc meanX

tBodyAcc meanY

tBodyAcc meanZ

tBodyAcc stdX

tBodyAcc stdY

tBodyAcc stdZ

fBodyAcc meanX

fBodyAcc meanY

fBodyAcc meanZ

fBodyAcc stdX

fBodyAcc stdY

fBodyAcc stdZ


**Gravity Acceleration**

tGravityAcc meanX

tGravityAcc meanY

tGravityAcc meanZ

tGravityAcc stdX

tGravityAcc stdY

tGravityAcc stdZ


**Body Acceleration Jerk**

tBodyAccJerk meanX

tBodyAccJerk meanY

tBodyAccJerk meanZ

tBodyAccJerk stdX

tBodyAccJerk stdY

tBodyAccJerk stdZ

fBodyAccJerk meanX

fBodyAccJerk meanY

fBodyAccJerk meanZ

fBodyAccJerk stdX

fBodyAccJerk stdY

fBodyAccJerk stdZ


**Body Gyroscope**

tBodyGyro meanX

tBodyGyro meanY

tBodyGyro meanZ

tBodyGyro stdX

tBodyGyro stdY

tBodyGyro stdZ

fBodyGyro meanX

fBodyGyro meanY

fBodyGyro meanZ

fBodyGyro stdX

fBodyGyro stdY

fBodyGyro stdZ



**Body Gyroscope Jerk** 

tBodyGyroJerk meanX

tBodyGyroJerk meanY

tBodyGyroJerk meanZ

tBodyGyroJerk stdX

tBodyGyroJerk stdY

tBodyGyroJerk stdZ


**Body Acceleration Magnitude**

tBodyAccMag mean

tBodyAccMag std

fBodyAccMag mean

fBodyAccMag std


**Gravity Acceleration Magnitude**

tGravityAccMag mean

tGravityAccMag std


**Body Acceleration Jerk Magnitude**

tBodyAccJerkMag mean

tBodyAccJerkMag std

fBodyBodyAccJerkMag mean

fBodyBodyAccJerkMag std


**Body Gyroscope Magnitude**

tBodyGyroMag mean

tBodyGyroMag std

fBodyBodyGyroMag mean

fBodyBodyGyroMag std


**Body Gyroscope Jerk Magnitude**

tBodyGyroJerkMag mean

tBodyGyroJerkMag std

fBodyBodyGyroJerkMag mean

fBodyBodyGyroJerkMag std




## Data transformations

The following transformations have been applied to the raw data.
Raw data can be found under the *UCI HAR Dataset* folder

1. extract the training data (X_train.txt) and append the activity data to it (Y_train.txt)
2. extract the test data (X_test.txt) and append the activity data to it (y_test.txt)
3. merge the two resulting sets with bind_rows into a new set called *complete_set*
4. use grep and select to keep only the variables pertaining to standard deviation "std()" and mean "mean()"
5. read activity labels from file "activity_labels.txt"
6. convert activity variable to a factor using levels collected in the previous step
7. clean-up the variable names by removing uncessary "-" and "()"
8. create a summary data set called *activity_summary* that aggregates the mean of all variables grouped by activity


