CleanDataProject
================

run_analysis.R reads the train and test files and concatenates to a single data. Computes the average of each feature variable for each activity and each subject.

It needs the following files for reading:

./features.txt - Features information
./activity_labels.txt - Activity tags

./train/subject_train.txt - Subject data from Train split
./test/subject_test.txt - Subject data from Test split

./train/y_train.txt - Activity data from Train split
./test/y_test.txt - Activity data from Test split

./train/X_train.txt - Feature variable values from Train split
./test/X_test.txt - Feature variable values from Test split

Additional details on working of the script is described in CodeBook.md