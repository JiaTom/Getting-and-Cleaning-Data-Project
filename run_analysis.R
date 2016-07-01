##This R script is used to load and reshape the UCI HAR Dataset,
##then print a tidy data with the average of each variable for 
##each activity and each subject in a csv file.
##There are three part in this script

#####################################################################
# First part:                                                       #
# Load the name of measurements on the mean and standard deviation. #
# Load the data of measurements on the mean and standard deviation  #
# and put in a dataframe and distribute names.                      #  
#####################################################################
feature_names <- read.table("UCI HAR Dataset/features.txt")
features <- grepl("mean|std", feature_names$V2)

train_features_all <- read.table("UCI HAR Dataset/train/X_train.txt")
train_features <- train_features_all[,features]
test_features_all <- read.table("UCI HAR Dataset/test/X_test.txt")
test_features <- test_features_all[,features]

all_features <- rbind(train_features,test_features)
colnames(all_features) <- feature_names[features,2]

#####################################################################
# Second Part:                                                      #
# Load activity data from both train and test, then combine them.   #
# Load subject data from both train and test, then combine them.    #
#                                                                   #
#####################################################################
## activity data transaction: 
train_act <- read.table("UCI HAR Dataset/train/y_train.txt")
test_act <- read.table("UCI HAR Dataset/test/y_test.txt")
all_act <- rbind(train_act,test_act)
act_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
## create activity data in factor variable due to the lable needed
all_act$activity <- factor(all_act$V1, levels = act_labels$V1, labels = act_labels$V2)

## subject data transaction:
train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
all_subjects <- rbind(train_subjects,test_subjects)

#####################################################################
# Third Part:                                                       #
# Combine both subject and activity data.                           #
# Combine subject, activity and measurement (mean and sd) data.     #
# Compute the mean of measurement (mean and sd) data and write the  #
# result to tidyData_meanMeasure in both csv and txt format in      #
# Workspace.                                                         #
#####################################################################
subj_Act <- cbind(all_subjects, all_act$activity)
colnames(subj_Act) <- c("subjectID", "activity")

result_Data <- cbind(subj_Act,all_features)

##Compute the mean for the measurement data in result variable.
result <- aggregate(result_Data[,3:81], by=list(result_Data$subjectID,result_Data$activity),FUN = mean)
colnames(result)[1:2] <- c("subjectID", "activity")
write.table(result, file="tidyData_meanMeasure.txt", row.names = FALSE)
write.csv(result, file="tidyData_meanMeasure.csv")
