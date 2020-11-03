# Read Features.txt
features <- read.csv("data/features.txt", sep="", header=FALSE)
#extract labels 
wanted_features <- grep(".*mean.*|.*std.*", features[,2])
wanted_features_extract <- features[wanted_features,2]
wanted_features_extract = gsub('-mean', 'Mean', wanted_features_extract)
wanted_features_extract = gsub('-std', 'Std', wanted_features_extract)
wanted_features_extract <- gsub('[-()]', '', wanted_features_extract)
#head(wanted_features_extract)

#extract data train
train <- read.table("data/train/X_train.txt")[wanted_features]
train_activity <- read.table("data/train/Y_train.txt")
train_subject <- read.table("data/train/subject_train.txt")
train <- cbind(train_subject, train_activity, train)
#extract data test
test <- read.table("data/test/X_test.txt")[wanted_features]
test_activity <- read.table("data/test/Y_test.txt")
test_subject <- read.table("data/test/subject_test.txt")
test <- cbind(test_subject, test_activity, test)
#Merges the training and the test sets to create one data set
all_data <- rbind(train, test)
#head(all_data)
colnames(all_data) <- c("subject", "activity", wanted_features_extract)
#Uses descriptive activity names to name the activities in the data set
activity_labels <- read.csv("data/activity_labels.txt", sep="", header=FALSE)
activity_labels[,2] <- as.character(activity_labels[,2])
all_data$activity <- factor(all_data$activity, levels = activity_labels[,1], labels = activity_labels[,2])
#Tidy data
library(dplyr)
tidyData <- all_data %>%
  group_by(subject, activity) %>%
  summarise(across(everything(), mean))

#head(tidyData)
write.table(tidyData, "tidy_data.txt", row.names = FALSE, quote = FALSE)