Getting and Cleaning Data - Project CodeBook
====================

Overview
---------------------
Describes the variables, the data, and any transformations or work that you performed to clean up the data

Dataset Description
---------------------
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Data Transformation
---------------------
1) Merges the training and the test sets to create one data set.
	* Read in the following files
		- Features (UCI HAR Dataset/features.txt)
		- Activity Type (UCI HAR Dataset/activity_labels.txt)
		
        - Train Subject Identifier (UCI HAR Dataset/train/subject_train.txt)
		- Train Data (UCI HAR Dataset/train/x_train.txt)
		- Train Labels (UCI HAR Dataset/train/y_train.txt)

		- Test Subject Identifier (UCI HAR Dataset/test/subject_test.txt')
		- Test Data (UCI HAR Dataset/test/x_test.txt)
		- Test Labels (UCI HAR Dataset/test/y_test.txt)
    * Assign column names to datasets
	* Combine the datasets to form train and test datasets
	* Combine train and test datasets into a single dataset
	
2) Extracts only the measurements on the mean and standard deviation for each measurement.
	* Extract out the measurements, having **mean()** and **std()** in the column names 
	
3) Uses descriptive activity names to name the activities in the data set
	* Attach descriptive activity names (Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, Laying) to each of the 6 activity within the datasets
	
4) Appropriately labels the data set with descriptive variable names. 
	* Replace "**Acc**" with "**Accelerometer**"
	* Replace "**Gyro**" with "**Gyroscope**"
	* Replace "**Mag**" with "**Accelerometer**"
	* Replace "**std**" with "**StdDev**"
	* Replace "**mean**" with "**Mean**"
	
5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
	* Aggregate the dataset from **step 4** based on activity and subject identifiers
	* Sort the dataset according to activity and subject identifiers
	* Export as a text file (**tidyData.txt**) separated by comma
