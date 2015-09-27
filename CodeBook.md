---
title: "Coursera GetData Project"
author: "Priti Hukkoo"
date: "08/24/2015"
---

## Project Description
 We have been given a data set from Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

### GetData Course project requirements.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.

##Study design and data processing
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### For each record the following is provided:
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. Each row has 128 readings as has 
  been mentioned above.
* Triaxial Angular velocity from the gyroscope.  Each row has 128 readings as has 
  been mentioned above.
* A 561-feature vector with time and frequency domain variables.
* Its activity label.
* An identifier of the subject who carried out the experiment.


###Collection of the raw data - Description of how the data was collected.
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are:

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation
* max(): Largest value in array
* min(): Smallest value in array 
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values.
* iqr(): Interquartile range
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency 
* skewness(): skewness of the frequency domain signal
* kurtosis(): kurtosis of the frequency domain signal
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean

###Notes on the original (raw) data 
The raw data set provided to us contains the following files.
* 'README.txt'
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set. Each row has a 561 element feature vector.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set. Each row has a 561 element feature vector just as the train set has.
* 'test/y_test.txt': Test labels.
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
* 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.
* 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.  THis has standard gravity units 'g'.Every row shows a 128 element vector. The same description applies for the 'body_acc_x_train.txt' and 'body_acc_z_train.txt' files for the Y and Z axis.
* 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. The same description applies for the body_gyro_z_train.txt and body_gyro_y_train.txt.
* 'test/Inertial Signals/total_acc_x_test.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_test.txt' and 'total_acc_z_test.txt' files for the Y and Z axis.
* 'test/Inertial Signals/body_acc_x_test.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.  THis has standard gravity units 'g'.Every row shows a 128 element vector. The same description applies for the 'body_acc_x_test.txt' and 'body_acc_z_test.txt' files for the Y and Z axis.
* 'test/Inertial Signals/body_gyro_x_test.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. The same description applies for the body_gyro_z_test.txt and body_gyro_y_test.txt.

##Creating the tidy datafile

###Guide to create the tidy data file

From the requirements it is clear that we are only interested in a few of the measurements associated with the subject (1- 30) and 
activity(1 -6).
The measurements that are of interest to us are those involving mean and std. The comprehensive list of all these variables is given below.
Also the requirements of the project make it clear that only the data in the the X_test.txt , X_train.txt ,subject_test.txt, subject_train.txt and y_test.txt y_train.txt  along with the features.txt and activity_labels.txt.
**The data in the Inertial Signals direcory that are contained in the 9 axial files  as 128 element readings are not needed for this analysis**
The ultimate tidy_data.txt as per requirements should contain 180 observations ( ie 30 subject doing 6 activities  ) and each of them will have 66 unique mesaurements as listed below.
This would be the wide tidy format.
Since reading 66 colums per row is not befitting a tidy format we will melt the 66 columns into the rows where each column depicting a unique measurement will actually become a row , hence we will have a ** narrow tidy_data.txt with 11880 rows with 4 columns each ( Subject, Activity, Measure and value ) **
The list of required features are the 66 features listed below.
* tBodyAcc-mean()-X
* tBodyAcc-mean()-Y
* tBodyAcc-mean()-Z
* tBodyAcc-std()-X
* tBodyAcc-std()-Y
* tBodyAcc-std()-Z
* tGravityAcc-mean()-X
* tGravityAcc-mean()-Y
* tGravityAcc-mean()-Z
* tGravityAcc-std()-X
* tGravityAcc-std()-Y
* tGravityAcc-std()-Z
* tBodyAccJerk-mean()-X
* tBodyAccJerk-mean()-Y
* tBodyAccJerk-mean()-Z
* tBodyAccJerk-std()-X
* tBodyAccJerk-std()-Y
* tBodyAccJerk-std()-Z
* tBodyGyro-mean()-X
* tBodyGyro-mean()-Y
* tBodyGyro-mean()-Z
* tBodyGyro-std()-X
* tBodyGyro-std()-Y
* tBodyGyro-std()-Z
* tBodyGyroJerk-mean()-X
* tBodyGyroJerk-mean()-Y
* tBodyGyroJerk-mean()-Z
* tBodyGyroJerk-std()-X
* tBodyGyroJerk-std()-Y
* tBodyGyroJerk-std()-Z
* tBodyAccMag-mean()
* tBodyAccMag-std()
* tBodyAccMag-mad()
* tGravityAccMag-mean()
* tGravityAccMag-std()
* tBodyAccJerkMag-mean()
* tBodyAccJerkMag-std()
* tBodyGyroMag-mean()
* tBodyGyroMag-std()
* tBodyGyroJerkMag-mean()
* tBodyGyroJerkMag-std()
* fBodyAcc-mean()-X
* fBodyAcc-mean()-Y
* fBodyAcc-mean()-Z
* fBodyAccJerk-mean()-X
* fBodyAccJerk-mean()-Y
* fBodyAccJerk-mean()-Z
* fBodyAccJerk-std()-X
* fBodyAccJerk-std()-Y
* fBodyAccJerk-std()-Z
* fBodyGyro-mean()-X
* fBodyGyro-mean()-Y
* fBodyGyro-mean()-Z
* fBodyGyro-std()-X
* fBodyGyro-std()-Y
* fBodyGyro-std()-Z
* fBodyAccMag-mean()
* fBodyAccMag-std()
* fBodyBodyAccJerkMag-mean()
* fBodyBodyAccJerkMag-std()
* fBodyBodyGyroMag-mean()
* fBodyBodyGyroMag-std()
* fBodyBodyGyroJerkMag-mean()
* yBodyGyroJerkMag-std()
 

###Cleaning of the data
In order to process the data and get the required tidy_data.txt as the outcome , we need to do the following.

1. Download the data from the given url https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2. Read data from train and test set . They will be 3 files in each of the test/train directories that we will be getting the data from.
   * X_test/train.txt ( Readings/Measurements data)
   * y_test/train.txt ( Activity data)
   * subject_test/train.txt ( Subject data)
   All this data from test/train will be merged to form one set of data.
3. Meta data assocaited with the features and activities will be read features.txt and activity_labels.txt. 
4. The readings data got from y_test/train.txt will be filtered out only to give us those reading that are associated with means and standard deviations. Hence the element( column ) size will come down from 561 to 66 . I have only taken into considerations those measurements that are the mean and standard deviations  for each measurement , so measurements like meanFreq() which is  Weighted average of the frequency components to obtain a mean frequency  etc are ignored.
5. I have decided to go with the feature name which have been listed above , as the descriptive variable name. The main reason being that they are quite long and have I made it more descriptive they may not be any more useful. Some basic cleanup was done to make the feature names compatible with the R varibale naming conventions of no special caharacters and so have removed () and replaced '-' by '_'.Hence feature names like yBodyGyroJerkMag-std() will now look like yBodyGyroJerkMag_std .
6. Once we have the data is the above format , it is grouped_by the Subject and Activity to get the average values for the above measurements. All this is achieved by using the dplyr library . 
7. Once 180 observation with the required num of observation are got, it is melted down using the gather function from the tidyr package to get a tidy_data txt file in the narrow format of 11880 rows X 4 columns ( Subject, Measure, ACtivity ad Value)


##Description of the variables in the tiny_data.txt file
 The tidy_data.txt file is in the narrow format  and 
* has 11880 rows X 4 columns ( Subject, Activity, Measure and Value)
* The first column/variable is the Subject and can have values from 1 to 30. It is of type Integer .
* The second column/variable  is the  type of  Measure and could hold any of valid feature names listed above like tBodyAcc_mean_X, fBodyGyroMag_mean etc. These are of type factor since they can have only some fixed values. The feature names prefixed with  'f'  indicate frequency domain signals and those prefixed with 't' to denote time.
* The third column/variable  is the activity and can have the followig values (WALKING, WALKING_UP, WALKING_DOWN, SITTING, STANDING, LAYING). This too is of type factor.
* The last column/variable is the value of the measure specified in column 3. It depicts the average value of the measure from column 3 for that subject specified in column 1 and activity specified in column 2.This has type numeric.

I have put it in the following format so it is more tidy and readable. 

##Sources
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

