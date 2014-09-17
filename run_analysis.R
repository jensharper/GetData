# This script assumes that the data were unzipped into a folder called data
# within the working directory

# read in feature names
features<-read.table("data/features.txt")
col_names<-features[,2]

# read in .txt files and apply relevant column names
x_train <- read.table("data/train/X_train.txt", col.names=col_names)
y_train <- read.table("data/train/y_train.txt", col.names="activity")
subject_train <- read.table("data/train/subject_train.txt", col.names="subjectID")
x_test <- read.table("data/test/X_test.txt", col.names=col_names)
y_test <- read.table("data/test/y_test.txt", col.names="activity")
subject_test <- read.table("data/test/subject_test.txt", col.names="subjectID")

# merge data into a single dataset
test_data <- cbind(subject_test, y_test, x_test)
train_data <- cbind(subject_train, y_train, x_train)
data <- rbind(test_data, train_data)

# identify indices of column names that contain "mean" or "std"
meanANDstd <- union(grep("mean", col_names, ignore.case=TRUE), 
                    grep("std", col_names, ignore.case=TRUE))

# adjust indices to account for subjectID and activity columns (columns 1 and 2)
adj <- meanANDstd + 2 # shift indices by two
adj <- append(adj, c(1,2), after=0) # append subjectID and activity column numbers

# subset measurement data to mean and std variables
data_meanANDstd <- data[,adj]

# apply descriptive activity labels
for (i in 1:nrow(data_meanANDstd)){
  activity <- data_meanANDstd[i,"activity"]
  if (activity == 1){
    label <- "walking"
  }
  else if (activity == 2){
    label <- "walking upstairs"
  }
  else if (activity == 3){
    label <- "walking downstairs"
  }
  else if (activity == 4){
    label <- "sitting"
  }
  else if (activity == 5){
    label <- "standing"
  }
  else {
    label <- "laying"
  }
  
  data_meanANDstd[i,"activity"] <- label
}

# create summary dataset with the means of all features for each subject and activity
library(plyr) # assumes plyr is already installed
data_summary <- ddply(data_meanANDstd, .(subjectID, activity), numcolwise(mean))

# publish summary dataset
write.table(data_summary, file = "tidydataset.txt", row.names = FALSE)