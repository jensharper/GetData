Course Project for Coursera's Getting and Cleaning Data
=======

The raw data for this project were obtained from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
The R script (run_analysis.R) assumes that the data have been unzipped into a folder called "data" within the working directory.
It also assumes that the plyr package has been installed.

The R script accomplishes the project steps in a different order than listed in the instructions.

Step 4 is accomplished at the start of the script.
The data are labeled with the variable names provided in "features.txt" as they are read into R.
Descriptions of the variables were provided with the raw data in the file "features_info.txt".

Next, Step 1 is accomplished using cbind and rbind.

Then, Step 2 is accomplished using regular expressions (grep). 
86 column names were identified as containing "mean" or "std".
The indices corresponding to these column names are used to subset the data.

Then, Step 3 is accomplished using if-else statements to change activity labels from 1-6 to descriptive names.

Then, Step 5 is accomplished using ddply from the plyr package and write.table to write the resulting dataframe to "tidydataset.txt".
