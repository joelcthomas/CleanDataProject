## run_analysis.R reads the train and test files and concatenates to a 
## single data. Computes the average of each feature variable for each 
## activity and each subject

## Load necessary libraries
library(data.table)
library(reshape)

## Read features and activity labels
features <- read.table("./features.txt",col.names=c('FeatureID','FeatureName'))
activityLabels <- read.table("./activity_labels.txt",col.names=c('ActivityCode','ActivityName'))

## Read activity data from Train and Test
activityTrain <- read.table("./train/y_train.txt",col.names=c('ActivityCode'))
activityTest <- read.table("./test/y_test.txt",col.names=c('ActivityCode'))

## Read subject data from Train and Test
subjectTrain <- read.table("./train/subject_train.txt",
                           col.names=c('SubjectID'))
subjectTest <- read.table("./test/subject_test.txt",
                          col.names=c('SubjectID'))

## Read feature variable values from Train and Test
valuesTrain <- read.table("./train/X_train.txt",header=FALSE,
                          col.names=features$FeatureName)
valuesTest <- read.table("./test/X_test.txt",header=FALSE,
                         col.names=features$FeatureName)

## Bind Activity, Subject and feature values together
trainData <- cbind(activityTrain,subjectTrain,valuesTrain)
testData <- cbind(activityTest,subjectTest,valuesTest)

## Bind train and test data
allData <- rbind(trainData,testData)

## Select only variable which has mean() or std()
featuresOfInterest <- as.vector(features$FeatureName[
                                grepl("mean()",features$FeatureName)|
                                grepl("std()",features$FeatureName)])
featuresOfInterest<-gsub("\\-|\\,|\\(|\\)","\\.",featuresOfInterest)

## Aggregate to find average of each variable for each activity and each subject
finalData <- aggregate(allData[,c(featuresOfInterest)], 
                       by=list(subjectID=allData$SubjectID, 
                       ActivityCode=allData$ActivityCode), 
                       FUN=mean)

## Merge to add activityLabels to show descriptively 
finalData <- merge(activityLabels,finalData)

## Export clean tidy data
write.csv(finalData,file='finalData.csv',row.names = FALSE)
