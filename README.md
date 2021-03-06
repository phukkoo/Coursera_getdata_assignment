GetData_CourseProject
=====================

Repository contains peer-assessed Coursera's Getting-and-Cleaning-Data Course Project.


`run_analysis.R` is a script that performs the following:

1. Downloads data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2. Unzips it into ./getdata directory
3. Each of the files for Subject(which contains Subject information, ie numbers, 1 - 30), y(this contains activity info)  and X(contains measurements as a 561 element vector), 
   both from test and train data sets is then read into its own data frame using `read.table`
4. All data frames are merged using `rbind` to combine test and train datasets  of Subject, y and X txt data files.
5. Meta data for features and activity are read .
    * Features names and column info is read from features.txt
    * Activity info is read in from the activity labels txt
6. Sine we are only interested in measurements that are mean or standard deviations, `grepl` was used to find all column names in the measurement data frame containing "mean()" or "std()". I am excluding columns containing "meanFreq" since functionaly it isn't a measurement of the data from the sensors, but a rate of measurement.
7. Activity IDs are replaced by the respective activity names in the activity data using the factor funtionality.
8. All data frames are combined using `cbind` to combine Subject, Activity and measurement data.
9. Column are given meaningful names using hard-coded values for *Subject* and *Activity* and those read programmatically from **features.txt** data set. the feature names are 
   made compatible with R variable naming conventions like removing special caharacter and replacing '-' by '_'. 
10. Now we need to create the tidy data set. This tidy data set should have one observation per subject and activity containing the means of the measurements of interest.
    This was achieved by using 'dplyr' and 'tidyr' 
    * grouped the above data frame using grouped_by ( subject, activity)
    * Then in each of the resulting groups find the average of the variables by using summarize on the mean funtion for all the measaurement variables.
    
11. This will result in 180 rows of observation with 68 columns. ( 30 subjects times 6 activities and 66 measurements).
    Since reading 68 columns may be a bit messy, I tidied this further by gathering(melting) the 66 columns to rows hence reshaping from  wide format to long narrow format.
    The gather() function will take multiple columns and collapse them into key-value pairs, duplicating all other columns as needed.
    * gathered is used to change from wide to narrow format . This results in a dataframe of 11880 rows X 4 columns.
    * then it rearranges columns so we see Subject, Measurement , Activity and Value.
12. Uses `write.table` to save the final tidy dataset as a CSV file names ./data/tidydata.txt. File can be read back with `read.table("./data/tidydata.txt")`
