setwd("/Users/manuelventero/Documents/COURSERA/DATA_SCIENCE_SPECIALIZATION/3_Getting_and_Cleaning_Data/Week3/PROJECT/UCI HAR Dataset 2/")
dir()


##
features <- read.table("features.txt", header = F)
activityType <- read.table("activity_labels.txt", header = F)


## Test Data
testX <- read.table("test/X_test.txt", header = F)
testY <- read.table("test/y_test.txt", header = F)
testSubjects <- read.table("test/subject_test.txt", header = F)

## Train Data
trainRows <- read.table("train/X_train.txt", header = F)
trainColumnNames <- read.table("train/y_train.txt", header = F)
trainSubjects <- read.table("train/subject_train.txt", header = F)


