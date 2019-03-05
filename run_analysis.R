install.packages(c("dplyr", "tidyr"))
library(tidyr)
library(dplyr)

# 1. Merges the training and the test sets to create one data set.
# 4. Appropriately labels the data set with descriptive variable names. 
# Reading train data & naming column names
X_train <- read.table("C:/Users/P1321155/Desktop/Coursera/Coursera R Project/CourseProject/Getting and Cleaning Data/UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("C:/Users/P1321155/Desktop/Coursera/Coursera R Project/CourseProject/Getting and Cleaning Data/UCI HAR Dataset/train/Y_train.txt")
Subject_train <- read.table("C:/Users/P1321155/Desktop/Coursera/Coursera R Project/CourseProject/Getting and Cleaning Data/UCI HAR Dataset/train/subject_train.txt")
# Reading test data
X_test <- read.table("C:/Users/P1321155/Desktop/Coursera/Coursera R Project/CourseProject/Getting and Cleaning Data/UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("C:/Users/P1321155/Desktop/Coursera/Coursera R Project/CourseProject/Getting and Cleaning Data/UCI HAR Dataset/test/Y_test.txt")
Subject_test <- read.table("C:/Users/P1321155/Desktop/Coursera/Coursera R Project/CourseProject/Getting and Cleaning Data/UCI HAR Dataset/test/subject_test.txt")
# Reading features data
Features <- read.table("C:/Users/P1321155/Desktop/Coursera/Coursera R Project/CourseProject/Getting and Cleaning Data/UCI HAR Dataset/features.txt")
# Reading activity labels
Activity_Labels <- read.table("C:/Users/P1321155/Desktop/Coursera/Coursera R Project/CourseProject/Getting and Cleaning Data/UCI HAR Dataset/activity_labels.txt")
# Column names
colnames(X_train) <- Features[,2]
colnames(Y_train) <- "activityID"
colnames(Subject_train) <- "subjectID"
colnames(X_test) <- Features[,2]
colnames(Y_test) <- "activityID"
colnames(Subject_test) <- "subjectID"
# Merge train
TRAIN <- cbind(Y_train,X_train,Subject_train)
TEST <- cbind(Y_test,X_test,Subject_test)
ALL <- rbind(TRAIN,TEST)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
Colnames <- colnames(ALL)
Mean_STD <- (grepl("activityID" , Colnames) | grepl("subjectID" , Colnames) | grepl("mean.." , Colnames) | grepl("std.." , Colnames))
SET_MEAN_STD <- ALL[ , Mean_STD == TRUE]

# 3. Uses descriptive activity names to name the activities in the data set
SET_ACTIVITY_NAMES <- merge(x=SET_MEAN_STD, y=Activity_Labels, by.x='activityID', by.y = 'V1', all.x=TRUE)
colnames(SET_ACTIVITY_NAMES)[82] <- "activityNames"

# 5. From the data set in step 4, creates a second, independent tidy data set with the average
TidySet <- aggregate(. ~subjectID + activityID, SET_ACTIVITY_NAMES, mean)
TidySet <- TidySet[order(TidySet$subjectID, TidySet$activityID),]

#Save data
write.table(TidySet, "TidySet.txt", row.name=FALSE)