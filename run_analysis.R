
library(plyr)
library(dplyr)

# set working directory, download and unzip the file

file_URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
wd <- getwd()
path <- file.path(wd, 'data')
if (!file.exists(path)) {dir.create(path);
download.file(file_URL, destfile = file.path(path, "dataset.zip"), mode = 'wb', method = 'libcurl');
unzip("./data/dataset.zip", exdir = "./data", junkpaths = TRUE);
unlink(file.path(path, "dataset.zip"))}

# Read the data 
x_test <- read.table(file.path(path, 'X_test.txt'))
x_train <- read.table(file.path(path, 'X_train.txt'))

y_train <- read.table(file.path(path, 'y_train.txt'))
y_test <- read.table(file.path(path, 'y_test.txt'))

subject_train <- read.table(file.path(path, 'subject_train.txt'))
subject_test <- read.table(file.path(path, 'subject_test.txt'))

# Read the descriptive meta data
features <- read.table(file.path(path, 'features.txt'))
activity_labels <- read.table(file.path(path, 'activity_labels.txt'))

# Part 1 - Bind the data 
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# name columns
colnames(x_data) <- t(features[2])
colnames(y_data) <- "Activity"
colnames(subject_data) <- "Subject"

# merge data to a complete data set
data <- cbind(subject_data, y_data, x_data)

# make valid column names to avoid duplicates
valid_column_names <- make.names(names=names(data), unique=TRUE, allow_ = TRUE)
names(data) <- valid_column_names

# sort the data set by Subject and Activity
data_sort <- arrange(data, Subject, Activity)

# Part 2
# Extracts only the measurements on the mean and standard deviation for each measurement.

extracted_data <- select(data_sort, Subject, Activity, contains("Mean"), contains("Std"))

# Part 3
# Uses descriptive activity names to name the activities in the data set

# sets the columns "Subject" and "Activity" as factor variable
extracted_data$Activity <- as.factor(extracted_data$Activity)
extracted_data$Subject <- as.factor(extracted_data$Subject)

# "Defactorize" the activity labels
act_labels_char <- as.character(levels(activity_labels[,2]))

# rename the activities
extracted_data$Activity <- mapvalues(extracted_data$Activity, from = activity_labels[ ,1], to =act_labels_char)

# Part 4
# Appropriately labels the data set with descriptive variable names.

names(extracted_data) <- gsub('^t',"Time.",names(extracted_data))
names(extracted_data) <- gsub('^f',"Frequency.",names(extracted_data))
names(extracted_data) <- gsub('Acc',"Acceleration",names(extracted_data))
names(extracted_data) <- gsub('Gyro',"AngularSpeed",names(extracted_data))
names(extracted_data) <- gsub('Mag',"Magnitude",names(extracted_data))
names(extracted_data) <- gsub('Jerk',"Derivative",names(extracted_data))
names(extracted_data) <- gsub('\\.mean',".Mean",names(extracted_data))
names(extracted_data) <- gsub('\\.std',".Std.Deviation",names(extracted_data))
names(extracted_data) <- gsub('Freq\\.',"Frequency.",names(extracted_data))
names(extracted_data) <- gsub('Freq$',"Frequency",names(extracted_data))

# Part 5
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidy_dataset <- ddply(extracted_data, .(Subject,Activity), numcolwise(mean))

# write a table as .txt file
write.table(tidy_dataset, file = "tidy_dataset.txt", row.names = FALSE)