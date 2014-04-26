## CodeBook for run_analysis.R  

run_analysis.R reads the train and test files and concatenates to a single data. Computes the average of each feature variable for each activity and each subject.

####Script Dependency (libraries)
 - data.table
 - reshape

####Variables in the script
 - features: Holds the data from features.txt 
 - activityLables: Holds the activity labels lookup date
 - activityTrain: Holds activity data from Train set
 - activityTest: Holds activity data from Test set
 - subjectTrain: Holds subject data from Train set
 - subjectTest: Holds subject data from Test set
 - valuesTrain: Holds feature variable values from Train set
 - valuesTest: Holds feature variable values from Test set
 - trainData: This is a combined data from activity, subject and feature variable from Train data
 - testData: This is a combined data from activity, subject and feature variable from Test data
 - allData: This is both combined train and test data.
 - featuresOfInterest: Holds column labels of interest (Holds which of them refer to mean() or std() )
 - finalData: Holds the final clean data

 ####workflow
 - It is assumed, the data required are availbe in the format as described in README.md  
 - read.table is used to read all 8 files that are required.  
 - cbind and rbind are used to combine all the data into a single data frame.  
 - regex functions such as grepl are used to find which of the columns refer to mean() and std()  
 - gsub function is used to remove chracters that are not allowed in column names.  
 - Aggregate function is used to calculate the average of each feature variable for each activity and each subject.  
