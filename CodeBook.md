# Code Book - Getting and Cleaning Data Project

Manuel Ventero

### Introduction

The upcoming information gives a heads up to any future reader about any variables, data or transformations that may occur.


### Source Data

This script takes data taken from 30 volunteers within an age range of 19 to 48 years. Each person performed different activities while wearing their smartphones:

- Walking
- Walking upstairs
- Walking downstairs
- Sitting
- Standing
- Laying

Measurements are taken from the accelerometer and the gyroscope.

From the collected data two output sets where generated, the 70% percent for training and the 30% for testing.


### Section 1. 

This section is in charge of generating a unique data sets. Data is taken from different files, listed below. These files are first located and then loaded using the read table function.

Files list:

- features.txt
- activity_labels.txt
- subject_train.txt
- x_train.txt
- y_train.txt
- subject_test.txt
- x_test.txt
- y_test.txt

After reading in the files, columns are set, and data is merge onto a unique data set.



## Section 2. 

The final data set is filtered to keep only columns containing information on the mean and standard deviation attributse.

## Section 3.

The activity name is added to the data set to make it more descriptive.

## Section 4. 

Data column names are replaced to make them more readable.

Common replaces:

- mean() by Mean
- std() by SD


## Section 5. 

With the clean data set.

- First filter out the activity type name, as it won't be used in the grouping.
- Second, use the aggregate function to compute the mean for each column after grouping by subject and activity type.
- After grouping and computing the mean, insert the activity type name again.
- Use the order function to order by activity and subject.
- Remove the row.names columns as it is only used for ordering.
- Export the data set to a text file using write.table.

