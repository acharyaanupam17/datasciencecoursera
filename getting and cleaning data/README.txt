==================================================================
Coursera: Data Science Specialization
Course 3: Getting and Cleaning Data

Dataset Used for Analysis: Human Activity Recognition Using Smartphones Dataset
=================================================================
DataSet contained the data of experiments that had been carried out with a group of 30 participants. The participants performed six activities  - WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING. All the data had been randomly divided into the test data and the train data in the ratio of 70:30.

There are 4 files in the raw data. 
1. 'test' folder contains three files that were used:
	a. x_test contains the raw data of the observations
	b. y_test contains the  activity that the subject was performing i.e WALKING, WALKING_UPSTAIRS, 	WALKING_DOWNSTAIRS, SITTING, STANDING or LAYING
	c. subject_test containst the data on which participant who was conducting the activity.

2. 'train' folder contains three files that were used:
	a. x_train contains the raw data of the observations
	b. y_train contains the  activity that the subject was performing i.e WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING or LAYING
	c. subject_train containst the data on which participant who was conducting the activity.
 
3. 'features_info.txt': Shows information about the variables used on the feature vector.

4.  'features.txt': List of all features.

5. activity_labels: List of all activities
==============================================================================
DATA ANALYSIS
1. First the subject_test, y_test and x_test were merged to create a merged test dataset. A similar exercise was done on the train dataset. Then the train and test data sets were merged to create a merged data set.
2. All the columns with mean or standard deviation in their names were subsetted out of the merged data set to create a refined data set.
3. Descriptive Activity names were taken from the features.txt file and were used to replace the Activity column in the refined data set.
4. The column names and the participant names were replaced in the dataset to make them more descriptive.
5. An independent tidy data set was created carrying the average of each variable for each activity and each subject. The file was stored as tidydata.txt.

==============================================================================
ANUPAM ACHARYA
INDIA


