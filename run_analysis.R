##################
# run_analysis.R

# After sourcing this file, run mergedata() at the R Studio prompt to run the analysis

# mergedata()  # merges the test and train, X and y, datasets into one, and runs the Helper Functions
# getmean_std() # extract the means and standard deviation measures from the original data
# name_activity() # convert original activity data from integer to descriptive string
# getcol_labels()   # attach the column labels from the features.txt file, and our own subject and activity labels 
# summary_means ()  # generate a summary of means on the extracted data, and write to subject_activity_means.csv

# 1. Merges the training and the test sets to create one data set.

mergedata<-function(){
    # get the data from the relevant test and train data files
    # and put it into memory, if its not already there
    if(!exists("test_data_x")){
        test_data_x<<-read.table("./dataset/test/X_test.txt", sep="")
    }
    if(!exists("test_data_y")){
        test_data_y<<-read.table("./dataset/test/y_test.txt", sep="")
    }
    if(!exists("train_data_x")){
        train_data_x<<-read.table("./dataset/train/X_train.txt", sep="")        
    }
    if(!exists("train_data_y")){
        train_data_y<<-read.table("./dataset/train/y_train.txt", sep="")
    }
    
    # get test subject IDs
    if(!exists("subject_test")){
        subject_test <<- read.table("./dataset/test/subject_test.txt", sep="")
    }
    # get train subject IDs
    if(!exists("subject_train")){
        subject_train <<- read.table("./dataset/train/subject_train.txt", sep="")
    }
    
    # combine the subject IDS for test and train sets into one
    subject_data = rbind(subject_test, subject_train)

    # combine 'x' data sets
    x_data <- rbind(train_data_x, test_data_x)

    # combine 'y' data sets
    y_data <- rbind(train_data_y, test_data_y)
    
    # combine 'x' and 'y' data sets into one
    xy_data <- cbind(subject_data, y_data, x_data)
    
    # label columns with descriptive variable names (see #4 below)
    xy_data <- getcol_labels(xy_data)
    
    # replace interger in the activity column with its string alternative (see #3 below)
    named_xy_data <- name_activity(xy_data)
    
    # extract only means measurements from the xy_data (see #2 below)
    mean_std <- getmean_std(named_xy_data)
    
    # get the means for each subject activity means (see #5 below)
    xy_means <- summary_means(mean_std)

    ## write the full merged data.table to a CSV file (if desired)
    # write.csv(named_xy_data, file = "xy_data.csv", row.names=FALSE)
    ## write the mean & std variables from merged data.table to a CSV file (if desired)
    # write.csv(mean_std, file = "mean_std.csv", row.names=FALSE)
}

# 2. Extract only the measurements on the mean and standard deviation 
#    for each measurement. 
getmean_std <- function(data){
        # get columns with the pattern "mean" or "std" in their colname
        mean_std <- new.data <- data[, grep('subject|activity|mean|std', names(data), ignore.case = TRUE)]
        return(mean_std)
}

# 3. Use descriptive activity names to name the activities in the data set   
name_activity <- function(xy_data){
    # a bit of a hack, but it works
    # would be better if the activity labels were pulled from the 
    # activity_labels.txt file then looped through
    xy_data$activity[xy_data$activity==1] <- "WALKING"
    xy_data$activity[xy_data$activity==2] <- "WALKING_UPSTAIRS"
    xy_data$activity[xy_data$activity==3] <- "WALKING_DOWNSTAIRS"
    xy_data$activity[xy_data$activity==4] <- "SITTING"
    xy_data$activity[xy_data$activity==5] <- "STANDING"
    xy_data$activity[xy_data$activity==6] <- "LAYING"
    return(xy_data)
}

# 4.  Appropriately label the data set with descriptive variable names
#     @param xy_data is a data.frame
getcol_labels<- function(xy_data){
    # get the list of column names from features.txt
    features <- read.csv("./dataset/features.txt", sep=" ", quote = "", header=F)$V2 # we just want the second column $V2
    feature_vector<-as.character(features)  # convert features data.frame into a character vector of column names
    names(xy_data) <- c("subject", "activity", feature_vector) # prepend the first two column labels onto feature_vector and apply to xy_data
    return(xy_data)
}

# 5. From the data set in step 4, create a second, independent tidy data
#    set the average of each variable for each activity and each subject.
#    @param xy_data is a clean data frame
summary_means <- function(xy_data){
    # Group by subject as factors
    xy_data$subject <- as.factor(xy_data$subject)

    # output mean summary grouped by subject and activity
    summaryData <- aggregate(. ~subject + activity, xy_data, mean)

    # Order the data to make it more readable
    summaryData <- summaryData[order(summaryData$subject,summaryData$activity),]
    
    # for the assignment create a clean CSV file with the summary of means for each subject
    write.table(summaryData, file = "subject_activity_means.csv", sep = ",", row.names = FALSE)
}
