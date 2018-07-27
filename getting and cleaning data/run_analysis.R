#Loading necessary libraries
library(dplyr)
library(data.table)

#Reading data from working directory
#--------------------------------------------------------------------
x_train <- read.table("./Week 4 Assignment/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./Week 4 Assignment/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./Week 4 Assignment/UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("./Week 4 Assignment/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./Week 4 Assignment/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./Week 4 Assignment/UCI HAR Dataset/test/subject_test.txt")

features <- read.table("./Week 4 Assignment/UCI HAR Dataset/features.txt")

activity_labels <- read.table("./Week 4 Assignment/UCI HAR Dataset/activity_labels.txt")
activity_labels <- activity_labels[,2]
#--------------------------------------------------------------------
#Merge the train dataset
train <- cbind(subject_train, y_train, x_train)
#Merge the test dataset
test <- cbind(subject_test, y_test, x_test)

#Soln 1: Merges the training and the test sets to create one data set
alldata <- rbind(train, test)

mean <- grepl("mean", features$V2)
std <- grepl("std", features$V2)
#Picking up variable names containing "mean" and "std"
variable <- grep("mean|std", features$V2, value = FALSE)
#Picking up Subject Name, Activity Name and all variable names
#containing mean and std
variable <- c(1, 2, variable + 2)

colnames(alldata) <- c("Subject", "Activity", t(features[2]))
#Soln 2: Extract the mean and standard deviation data
final <- alldata[, variable]

#soln 3: Descriptive activity names to name the activities in the data set
final$Activity <- factor(final$Activity, levels(as.factor(final$Activity)), activity_labels)

#Soln 4: Appropriately labels the data set with descriptive variable names
names(final) <- gsub("Acc", "Accelerator", names(final))
names(final) <- gsub("Mag", "Magnitude", names(final))
names(final) <- gsub("Gyro", "Gyroscope", names(final))
names(final) <- gsub("^t", "time", names(final))
names(final) <- gsub("^f", "frequency", names(final))
#Replacing all Subject names to Participant number
for(i in 1:nrow(final)){final$Subject[i] <- paste("Participant", final$Subject[i])}

#Soln 5: From the data set in step 4, creates a second, independent tidy data set
#with the average of each variable for each activity and each subject
newfinal <- data.table(final)
tidydata <- newfinal[, lapply(.SD, mean), by = 'Subject,Activity']
write.table(tidydata, file = "./Week 4 Assignment/tidydata.txt", row.names = FALSE)