library(plyr)

## It is assumed that working directory includes path to the
## "UCI HAR Dataset" directory. 
## Otherwise, kindly modify the path variable.
path = "./"; 
##

#Getting and Selecting Features to Read
features <- read.table(paste(path, "features.txt", sep = ""))[,2]; #names of the features
selected_features_bool <- grepl("mean\\(\\)", features) | grepl("std\\(\\)", features); #TRUE if we wish to select.
selected_features_names <- features[selected_features_bool]
selected_features_names <- gsub("[^[:alnum:] ]", ".", gsub("\\(\\)", "", tolower(selected_features_names))) # to remove camel case and special characters
col_classes <- rep("NULL", length(features));
col_classes[selected_features_bool] <- "numeric" #colclasses is null everywhere except where we selected.

#Getting Activity Names
activities <- read.table(paste(path, "activity_labels.txt", sep = ""), colClasses = c("NULL", "character"))[,1];
activities <- gsub("(^|[[:space:]])([[:alpha:]])", "\\U\\1\\2", gsub("_", " ", tolower(activities)), perl = TRUE) #formatting

#Reading the Data and Labelling
X_train <- read.table(paste(path, "train/X_train.txt", sep = ""), colClasses = col_classes);
colnames(X_train) <- selected_features_names;
y_train <- read.table(paste(path, "train/y_train.txt", sep = ""))[,1];
subject_train <- read.table(paste(path, "train/subject_train.txt", sep = ""))[,1];
train_data <- cbind(Subject = subject_train, Activity = activities[y_train], Set = "Train", X_train);

X_test <- read.table(paste(path, "test/X_test.txt", sep = ""), colClasses = col_classes);
colnames(X_test) <- selected_features_names;
y_test <- read.table(paste(path, "test/y_test.txt", sep = ""))[,1];
subject_test <- read.table(paste(path, "test/subject_test.txt", sep = ""))[,1];
test_data <- cbind(Subject = subject_test, Activity = activities[y_test], Set = "Train", X_test);

#Two Tidy Data Sets
tidy_data_1 <- rbind(train_data, test_data)
tidy_data_2 <-aggregate( . ~ Subject + Activity, data = tidy_data_1[,c(-3)], FUN = mean); #Train/Test column now irrelevant
tidy_data_2 <- arrange(tidy_data_2, Subject, Activity);

#Outputting the second set 
write.table(tidy_data_2, "tidy_data_2.txt", row.names = FALSE);

#Cleaning Up
list <- c("activities", "col_classes", "features",
          "selected_features_bool", "selected_features_names", 
          "subject_test", "subject_train", "test_data", "train_data", 
          "X_test", "X_train", "y_test", "y_train", "list");
rm(list = list);


