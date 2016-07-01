# Read Me

This ReadMe file will give a general introduction about files of this repo.

### I. Files in this repo:
* README.md
* CodeBook.md
* run_analysis.R

### II. Introduction for each file:

##### i. ReadME.md:
Give a general introduction about files of this repo.

##### ii. CodeBook.md:
Indicate all the variables and summaries calculated, along with units, and any other relevant information for the output of the
run_analysis.R file.

##### iii. run_analysis.R:
This is an R script that load the load the UCI HAR Dataset and subset the desired data, which is the mean and standard deviation for the measurement in the original data. Then reshape the desired data and compute the mean for them. The specific requirement for r script is given below:
  1.  Merges the training and the test sets to create one data set.
  2.  Extracts only the measurements on the mean and standard deviation for each measurement.
  3.  Uses descriptive activity names to name the activities in the data set
  4.  Appropriately labels the data set with descriptive variable names.
  5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each          activity and each subject.

  Notice: training and test sets is the data (coloums) in UCI HAR Dataset, each of training and test sets have a lot of data,          including mean and standard deviation measurement. 

The R script is divided into three parts.
 1. Load and combine the names and data of mean and standard deviation measurement.
 2. Load and combine activity and subject data in both train and test set
 3. Combine subject, activity and measurement data. Compute the average of measurement and output in both txt and csv file.
 
 Before run the R code set the work directory to the folder that contain the 'UCI HAR Dataset' folder, then source the script.
 For the detail explanations of code. Please see the annotation in run_analysis.R. 
