---
title: "README"
author: "SNG JUN QIANG"
date: "5 March 2019"
output:
    html_document:
            keep_md: true
---



### Getting-and-Cleaning-Data-Week-4-Assignment 

#### This repo explains how all of the scripts work and how they are connected. 

#### The various text files were imported into R working directory using read.table function. 

#### The training and the test sets are created as one data set using rbind and cbind. Column names are assigned to the data set. 

#### grepl function is used get the data and create a data set to extract only the measurements on the mean and standard deviation for each measurement. 

#### Uses descriptive activity names to name the activities in the data set by merging SET_MEAN_STD and activity_labels. 

#### a second independent tidy data set (TidySet) with the average of each variable for each activity and each subject.
