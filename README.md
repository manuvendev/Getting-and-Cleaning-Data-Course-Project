# README - Getting and Cleaning Data Project

Manuel Ventero

### Introduction

This project takes data from The UCI Machine Learning Repository and modifies it for future uses.

### First Steps

- First thing to do is to download the compressed data from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

- Second, modify the path on the top of the file to point it to the directory where you unzipped the data in step one.
- Finally, execute the run_analysis.R script and a finalData.txt file will be generated.

### Script Objectives

The run_analysis script should fulfill the following requirements:

- Generates a unique data set by joining the training and the test sets.
- Selects only the mean and standard deviation columns.
- Edits column names to make them more readable.
- Replaces activity indexes by descriptive names.
- Generates and creates an output file with a data set containing a grouped set of means for every variable grouped yb activity and subjects.

### Additional Information

For a more detailed document head to the CodeBook.md file.
