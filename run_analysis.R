## Setting local path
setwd("/Users/manuelventero/Documents/COURSERA/DATA_SCIENCE_SPECIALIZATION/3_Getting_and_Cleaning_Data/Week3/PROJECT/UCI HAR Dataset 2/")

## Read features and activity types 
features <- read.table("features.txt", header = F)
activityType <- read.table("activity_labels.txt", header = F)

## Set colnames for activities set
colnames(activityType)  = c('activityId','activityType');


## Retrieving Test Data
testX <- read.table("test/X_test.txt", header = F)
testY <- read.table("test/y_test.txt", header = F)
testSubjects <- read.table("test/subject_test.txt", header = F)

## Setting colnames for test data
colnames(testSubjects)  <- "subject"
colnames(testX)         <- features$V2 
colnames(testY)         <- "activityId"

## Merge sets into a unique testSet
testSet <- cbind(testSubjects, testY, testX)


## Retrieving Train Data
trainX <- read.table("train/X_train.txt", header = F)
trainY <- read.table("train/y_train.txt", header = F)
trainSubjects <- read.table("train/subject_train.txt", header = F)

## Setting colnames for train data
colnames(trainSubjects) <- "subject";
colnames(trainX)         <- features$V2; 
colnames(trainY)         <- "activityId";

## Merge sets into a unique trainSet
trainSet <- cbind(trainSubjects, trainY, trainX)

## Merging data sets
mergedDataSet <- rbind(trainSet,testSet)


#############################################################################################
# 2 .Extracts only the measurements on the mean and standard deviation for each measurement #
#############################################################################################

## Get names of merged dataset
namesVector <- colnames(mergedDataSet)

## Get mean, std, subject and activity columns
matches <- ( grepl("subject",namesVector) | 
                grepl("activityId",namesVector) | 
                grepl("..-mean..$",namesVector) & !grepl("mean..-",namesVector)  & !grepl("meanFreq",namesVector) |
                grepl("..-std..$",namesVector) & !grepl("std..-",namesVector) 
);

## Filter data set based previous matches
filteredDataSet <- mergedDataSet[matches==TRUE];

#############################################################################
# 3 .Uses descriptive activity names to name the activities in the data set #
#############################################################################

# Merge final data set with the activity types data set
filteredDataSet <- merge(activityType, filteredDataSet, by = 'activityId', all.x=TRUE);

#############################################################################
# 4 .Appropriately labels the data set with descriptive variable names      #
#############################################################################
namesVector <- colnames(filteredDataSet)
    
for (i in 1:length(namesVector)) 
{
    namesVector[i] <- gsub("-mean.."," Mean",namesVector[i])
    namesVector[i] <- gsub("-std.."," SD",namesVector[i])
};

colnames(filteredDataSet) <- namesVector;


####################################################################################################################################################
# 5 .From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject #
####################################################################################################################################################

# Create a new table, finalDataNoActivityType without the activityType column
finalDataNoActivityType  <- filteredDataSet[,names(filteredDataSet) != 'activityType'];

# Summarizing the finalDataNoActivityType table to include just the mean of each variable for each activity and each subject
finalData <- finalDataNoActivityType[names(finalDataNoActivityType) != c('activityId','subject')]

# Aggregate by activity and subject and compute the mean
aggregatedByActivityAndSubject <- aggregate(
    finalData,
    by =  list(activityId = finalDataNoActivityType$activityId, subject = finalDataNoActivityType$subject),
    mean
    );

# Add the activity type by merging
aggregatedByActivityAndSubject <- merge(aggregatedByActivityAndSubject, activityType, by = 'activityId', all.x=TRUE);

# Write table
write.table(aggregatedByActivityAndSubject, './finalData.txt', row.names = TRUE, sep='\t');
