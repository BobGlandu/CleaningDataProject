#Pre-requisites: download and unzip from
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# The script assumes the data is present in the current working directory under 'UCI HAR Dataset'


library(tidyverse)

#Extract the features to be used a variable names for the dataset
features <- read_delim('UCI HAR Dataset/features.txt', delim = ' ', col_names = c('index', 'variableName'))

#Extract the X part of the test dataset
test <- read_delim('UCI HAR Dataset/test/X_test.txt', delim = ' ', trim_ws = TRUE, col_names = features$variableName)

# Append activities to the dataset
activities <- read_csv('UCI HAR Dataset/test/y_test.txt', col_names = c('Activity'))
test <- mutate(test, activity = activities$Activity)

#Extract the X part of the train dataset
train <- read_delim('UCI HAR Dataset/train/X_train.txt', delim = ' ', trim_ws = TRUE, col_names = features$variableName)

# Append activities to the dataset
train_activities <- read_csv('UCI HAR Dataset/train/y_train.txt', col_names = c('Activity'))
train <- mutate(train, activity = train_activities$Activity)

# Initiate the complete set by merging test and train
complete_set <- bind_rows(test, train)

# Keep only variables with mean and std in the name
complete_set <- complete_set %>% select(grep('mean\\()|std\\()|activity', names(complete_set)))

#Retrieve the activity labels from the file
activity_labels <- read_delim('UCI HAR Dataset/activity_labels.txt', delim = ' ', col_names = FALSE)

#Turn the activity variable into a factor
complete_set <- mutate(complete_set, activity = factor(complete_set$activity, levels = activity_labels$X1, labels = activity_labels$X2))

newVariableNames <- names(complete_set)

#Remove () and - to clean-up the appearance of variable names
newVariableNames <- sub("std\\()"," std", newVariableNames)
newVariableNames <- sub("mean\\()"," mean", newVariableNames)
newVariableNames <- gsub("-","", newVariableNames)

colnames(complete_set) <- newVariableNames

#Aggregate all variables by activity
activity_summary <- complete_set %>% group_by(activity) %>% summarize_all(mean)






