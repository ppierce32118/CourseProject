# Course Project - Getting and Cleaning Data

## Instructions

Clone this repository and run the run\_analysis.R script from within the cloned repository root directory.

This script will download and process the data set generating a tidy data set at `./TidyDataSet.txt`

## Data Source

This project uses the "Human Activity Recognition Using Smartphones Dataset" 
downloaded to ./getdata-projectfiles-UCI HAR Dataset.zip before run\_analysis.R from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Script Walkthrough

The run\_analysis.R script will perform the following steps:

* Extracts the data set files from the archive
* Reads training & test column files into respective x,y,s variables
* Reads feaure names and sets column/variable names respectively
* Appends the training and test data set rows
* Creates a unified data set (data frame)
* Extracts measurements on mean & standard deviation, for each measurement
* Sets activity names on the activity labels
* Labels data with descriptive variable/column names by removing special characters in the column names and by replacing hyphen's with underscores in the column names
* Removes columns used only for tidying up the data set (intermediate calculations)
* Melts the data set (note this is why we require reshape2 library)
* Creates a second, independent, tidy data set which contains the average of each variable for each activity and subject
* Saves the resulting tidy data set to file ./data/TidyDataSet.txt
