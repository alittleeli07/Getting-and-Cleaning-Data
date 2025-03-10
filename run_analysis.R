# Load necessary libraries
library(dplyr)

# Step 1: Download and unzip the dataset
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
file <- "UCI_HAR_Dataset.zip"
if (!file.exists(file)) {
  download.file(url, file, method = "curl")
}
unzip(file)

# Step 2: Read data
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("index", "feature"))
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

# Read training data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

# Read test data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")

# Step 3: Merge training and test sets
X_data <- rbind(X_train, X_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# Assign column names
colnames(X_data) <- features$feature
data <- cbind(subject_data, y_data, X_data)

# Step 4: Extract only mean and standard deviation measurements
selected_features <- grep("-(mean|std)\\(\\)", features$feature, value = TRUE)
data <- data[, c("subject", "code", selected_features)]

# Step 5: Use descriptive activity names
data$code <- factor(data$code, levels = activity_labels$code, labels = activity_labels$activity)
colnames(data)[2] <- "activity"

# Step 6: Label dataset with descriptive variable names
names(data) <- gsub("-mean\\(\\)", "_Mean", names(data))
names(data) <- gsub("-std\\(\\)", "_STD", names(data))
names(data) <- gsub("[()]", "", names(data))
names(data) <- gsub("^t", "Time_", names(data))
names(data) <- gsub("^f", "Frequency_", names(data))
names(data) <- gsub("Acc", "Accelerometer", names(data))
names(data) <- gsub("Gyro", "Gyroscope", names(data))
names(data) <- gsub("Mag", "Magnitude", names(data))
names(data) <- gsub("BodyBody", "Body", names(data))

# Step 7: Create a second tidy dataset with averages
final_data <- data %>%
  group_by(subject, activity) %>%
  summarise_all(mean)

# Step 8: Write the tidy dataset to a file
write.table(final_data, "tidy_dataset.txt", row.name = FALSE)
