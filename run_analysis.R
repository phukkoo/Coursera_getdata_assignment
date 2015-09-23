library("dplyr")
library("tidyr")
# read test data
subject_data_test <- read.table("/Users/phukkoo/coursera_getdata_class/UCI HAR Dataset/test/subject_test.txt")
activity_data_test <- read.table("/Users/phukkoo/coursera_getdata_class/UCI HAR Dataset/test/y_test.txt")
readings_data_test <- read.table("/Users/phukkoo/coursera_getdata_class/UCI HAR Dataset/test/X_test.txt")

# read train data
subject_data_train <- read.table("/Users/phukkoo/coursera_getdata_class/UCI HAR Dataset/train/subject_train.txt")
activity_data_train <- read.table("/Users/phukkoo/coursera_getdata_class/UCI HAR Dataset/train/y_train.txt")
readings_data_train <- read.table("/Users/phukkoo/coursera_getdata_class/UCI HAR Dataset/train/X_train.txt")

# combine the  test and train data as the Requirement 1 of the project
subject_data <- rbind(subject_data_test, subject_data_train)
activity_data <- rbind(activity_data_test, activity_data_train)
readings_data <- rbind(readings_data_test, readings_data_train)

# read features 
features_data <- read.table("/Users/phukkoo/coursera_getdata_class/UCI HAR Dataset/features.txt")
# read activity info
activity_labels <- read.table("/Users/phukkoo/coursera_getdata_class/UCI HAR Dataset/activity_labels.txt")

#get only rows containing mean and std 
# using regular expressions for this
reqd_features  <- filter(features_data, grepl(".*-mean\\(\\)-*|*-std\\(\\)-|*-mean\\(\\)$|*-std\\(\\)$",V2))
# this will give the column indices 
reqd_features_cols  <- reqd_features$V1

# Here we read only the columns we are interested in from the main data frame 
# fulfilling  Requirement 2 of the project
reqd_data <- readings_data[,reqd_features_cols ]

# Uses descriptive activity names to name the activities in the data set .
#fulfilling  Requirement 3 of the project
activity_name_data <- factor(activity_data$V1, levels = activity_labels[, 1], labels = activity_labels[, 2])

# use cbind to combine the subject, activity and measurement reading data.
# to get the data set which we can use to summarize and tidy
#complete_data <- cbind(cbind(subject_data,complete_activity_data),reqd_data)
complete_data <- cbind(subject_data, activity_name_data,reqd_data)


#Appropriately labels the data set with descriptive variable names. 
#fulfilling  Requirement 4 of  the project
colnames(complete_data) <- c("Subject","Activity", as.vector(reqd_features$V2))


# now group the data by Subject and Activity Name and get the mean values for 
# From the data set in step 4, creates a second, independent tidy data set
# with the average of each variable for each activity and each subject
dim_of_data <- dim(complete_data)
wide_tidy_data <- complete_data  %>% 
        group_by(Subject, Activity)  %>%
        summarise_each(funs(mean)) 
       
narrow_tidy_data <- wide_tidy_data %>% 
        gather( Measure, Average, 3:dim_of_data[2] ) %>%
        select(Subject, Measure, Activity, Average)  %>%
        arrange(Subject, Measure)

write.table(wide_tidy_data, "/Users/phukkoo/coursera_getdata_class/UCI HAR Dataset/wide_tidy_data.txt", row.name=FALSE)
write.table(narrow_tidy_data, "/Users/phukkoo/coursera_getdata_class/UCI HAR Dataset/narrow_tidy_data.txt", row.name=FALSE)

df2 <- read.table("/Users/phukkoo/coursera_getdata_class/UCI HAR Dataset/tidy_data1.txt")