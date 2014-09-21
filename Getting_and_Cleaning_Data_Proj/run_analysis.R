
#-------------------------------------------------------
#1. Merges the training and the test sets to create one data set.

# Read data files
features <- read.table('UCI HAR Dataset/features.txt',header=FALSE)
activityType <- read.table('UCI HAR Dataset/activity_labels.txt',header=FALSE)

subjectTrain <- read.table('UCI HAR Dataset/train/subject_train.txt',header=FALSE)
xTrain <- read.table('UCI HAR Dataset/train/x_train.txt',header=FALSE)
yTrain <- read.table('UCI HAR Dataset/train/y_train.txt',header=FALSE)

subjectTest <- read.table('UCI HAR Dataset/test/subject_test.txt',header=FALSE)
xTest <- read.table('UCI HAR Dataset/test/x_test.txt',header=FALSE)
yTest <- read.table('UCI HAR Dataset/test/y_test.txt',header=FALSE)

# Assign column names
colnames(activityType) <- c("activityId", "activityName")
colnames(subjectTrain) <- c("subjectId")
colnames(subjectTest) <- c("subjectId")
colnames(xTrain) <- features[,2]
colnames(yTrain) <- c("activityId")
colnames(xTest) <- features[,2]
colnames(yTest) <- c("activityId")

trainData <- cbind(yTrain, subjectTrain, xTrain)
testData <- cbind(yTest, subjectTest, xTest)

allData <- rbind(trainData, testData) 

#-------------------------------------------------------
#2. Extracts only the measurements on the mean and standard deviation for each measurement.
allData <- allData[, grepl("activityId|subjectId|-mean()|-std()", colnames(allData)) & !grepl("-meanFreq()", colnames(allData))]

#-------------------------------------------------------
#3. Uses descriptive activity names to name the activities in the data set
allData <- merge(allData, activityType, by='activityId', all.x=TRUE)

#-------------------------------------------------------
#4. Appropriately labels the data set with descriptive variable names.
colnames(allData) <- lapply(colnames(allData), function(v)
{
  w <- gsub("\\()", "", v)
  w <- gsub("mean", "Mean", w)
  w <- gsub("std", "StdDev", w)
  w <- gsub("Acc", "Accelerometer", w)
  w <- gsub("Gyro", "Gyroscope", w)
  w <- gsub("Mag", "Magnitude", w)
  w <- gsub("BodyBody", "Body", w)
  w
})

#-------------------------------------------------------
#5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Aggregate dataset by activityId, subjectId
tidyData <- aggregate(allData[, !colnames(allData) %in% c("activityId","subjectId", "activityName")], 
                      by=list(activityId=allData$activityId, subjectId=allData$subjectId), mean)

# Add activity name
tidyData <- merge(tidyData, activityType, by='activityId', all.x=TRUE)

# Sort data
tidyData <- arrange(tidyData, activityId, subjectId)

# Export data 
write.table(tidyData, 'tidyData.txt', row.names=FALSE, sep=',')
