datasciencecoursera/Getting_and_Cleaning_data
==============================================

Overview
---------------------
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis. 

This directory contains the following:
- R script (run_analysis.R) to generate tidy dataset
- Code book (CodeBook.md)

A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data for the project can be found at: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

For more information, please refer to the Code book.

Usage
---------------------
1. Place both dataset directory and the R script (run_analysis.R) together.
2. Execute the R script.

The R script will perform the following tasks: 
- Merges the training and the test sets to create one data set
- Extracts only the measurements on the mean and standard deviation for each measurement
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

3. A text file (tidyData.txt) will be generated.

