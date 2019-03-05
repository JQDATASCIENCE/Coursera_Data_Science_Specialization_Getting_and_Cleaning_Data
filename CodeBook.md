---
title: "Getting and Cleaning Data Assignment 4"
author: "SNG JUN QIANG"
date: "5 March 2019"
output:
    html_document:
            keep_md: true
---



### This code book (CodeBook.md) describes the variables, the data, and any transformations or work performed to clean up the data. 

### 1. Merges the training and the test sets to create one data set. 
### 4. Appropriately labels the data set with descriptive variable names. 

#### The following text files were imported and column names were assigned to X_train and X_test using variables from features text files 2nd column. activityID is assigned to Y_train and Y_test as column names. subjectID is is assigned to Subject_train and Subject_test. activity_labels text files will be used later. Y_train,X_train and Subject_train are merged to form TRAIN data frame. Y_test,X_test,Subject_test are merged to form TEST data frame. Train and TEST are merged to form ALL data frame.

#### - X_train.txt 
#### - Y_train.txt 
#### - subject_train.txt 
#### - X_test.txt 
#### - Y_test.txt 
#### - subject_test.txt 
#### - features.txt 
#### - activity_labels.txt 

### 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

#### grepl function is used get the data and create a data set (SET_MEAN_STD) according to the requirements. 

### 3. Uses descriptive activity names to name the activities in the data set. 

#### activity_labels is merged with SET_MEAN_STD by activityID and activityNames is assigned as column name. 

### 5. From the data set in step 4, creates a second, independent tidy data set with the average. 

#### aggregate function is used to get the average of each variable for each activity to form TidySet dataframe. It is finally saved as TidySet.txt file.
