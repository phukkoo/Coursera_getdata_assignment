library("dplyr")
library("tidyr")
## Check if the data directory exists and create if it doesn't
if(!file.exists("./getdata")) {
        dir.create("./getdata")
}

## Download and unzip dataset
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
tempFile <- tempfile()
download.file(fileURL, tempFile, method = "curl")
unzip(tempFile, exdir = "./getdata")
file.remove(tempFile)

# read test data
subject_data_test <- read.table("./getdata/UCI HAR Dataset/test/subject_test.txt")
activity_data_test <- read.table("./getdata/UCI HAR Dataset/test/y_test.txt")
readings_data_test <- read.table("./getdata/UCI HAR Dataset/test/X_test.txt")

# read train data
subject_data_train <- read.table("./getdata/UCI HAR Dataset/train/subject_train.txt")
activity_data_train <- read.table("./getdata/UCI HAR Dataset/train/y_train.txt")
readings_data_train <- read.table("./getdata/UCI HAR Dataset/train/X_train.txt")

# combine the  test and train data as the Requirement 1 of the project
subject_data <- rbind(subject_data_test, subject_data_train)
activity_data <- rbind(activity_data_test, activity_data_train)
readings_data <- rbind(readings_data_test, readings_data_train)

# read features 
features_data <- read.table("./getdata/UCI HAR Dataset/features.txt")
# read activity info
activity_labels <- read.table("./getdata/UCI HAR Dataset/activity_labels.txt")

#get only rows containing mean and std 
# using regular expressions for this
reqd_features  <- filter(features_data, grepl(".*-mean\\(\\)-*|*-std\\(\\)-|*-mean\\(\\)$|*-std\\(\\)$",V2))
# reqd_features column 1(v1) gives the column indices of the columns we need
# reqd_features column 2(v2) gives the column names of the columns we need
# this will give the column indices of the features that contain mean and std deviation
reqd_features_cols  <- reqd_features$V1

# Here we read only the columns we are interested in from the main data frame 
# fulfilling  Requirement 2 of the project
reqd_data <- readings_data[,reqd_features_cols ]

# Uses descriptive activity names to name the activities in the data set .
#fulfilling  Requirement 3 of the project
activity_name_data <- factor(activity_data$V1, levels = activity_labels[, 1], labels = activity_labels[, 2])

# use cbind to combine the subject, activity and measurement reading data.
# to get the data set which we can use to summarize and tidy
complete_data <- cbind(subject_data, activity_name_data,reqd_data)


#Appropriately labels the data set with descriptive variable names. 
# first we will tidy up the column names to be compliant with variable naming conventions of R
#fulfilling  Requirement 4 of  the project

clean_req_feature_names = gsub("\\(\\)", "", reqd_features$V2)
clean_req_feature_names = gsub("-", "_", clean_req_feature_names)
colnames(complete_data) <- c("Subject","Activity", as.vector(clean_req_feature_names))


# now group the data by Subject and Activity Name and get the mean values for 
# From the data set in step 4, creates a second, independent tidy data set
# with the average of each variable for each activity and each subject

# first get the dim of the data set do we know how many columns are present
dim_of_data <- dim(complete_data)

# using dplyr function
# group_by to group the data by subject and activity 
# and then in each of the resulting groups find the average of the variables by using summarize.
# this will give us tidy_data is wide format of 180 rows and 68 columnns ( 2 for subject and activity and the other 66 
# for the variables we need)
wide_tidy_data <- complete_data  %>% 
        group_by(Subject, Activity)  %>%
        summarise_each(funs(mean)) 

# since  reading 68 columns my be a bit messy, will tidy this further by gathering(melting) the 66 columns to rows instead
# using tidyr function gather and  Reshape wide format to long narrow format
# then rearranging columns so we see 
# Subject, Measure , Activity and value of Measure
narrow_tidy_data <- wide_tidy_data %>% 
        gather( Measure, Average, 3:dim_of_data[2] ) %>%
        select(Subject, Measure, Activity, Average)  %>%
        arrange(Subject, Measure)

# here we write out the tidy_data into a txt file.
write.table(narrow_tidy_data, "./getdata/UCI HAR Dataset/tidy_data.txt", row.name=FALSE)

# this is just to read back the tidy data from txt and check the output to verify that the file was created correctly
tidy_df <- read.table("./getdata/UCI HAR Dataset/tidy_data.txt", header = TRUE)
