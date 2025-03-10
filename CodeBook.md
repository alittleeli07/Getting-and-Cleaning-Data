# CodeBook

## Overview
This CodeBook describes the dataset used, variables, transformations, and steps taken to clean and prepare the data.

## Data Source
The data is obtained from the Human Activity Recognition Using Smartphones dataset, which contains accelerometer and gyroscope data collected from Samsung Galaxy S smartphones.

## Variables
- `subject`: Identifier for each subject (1-30).
- `activity`: The activity performed, one of:
  - WALKING
  - WALKING_UPSTAIRS
  - WALKING_DOWNSTAIRS
  - SITTING
  - STANDING
  - LAYING
- Feature variables: Measurements derived from the smartphone sensors, focusing on mean and standard deviation values. Examples:
  - `Time_BodyAccelerometer_Mean_X`
  - `Time_BodyAccelerometer_STD_Y`
  - `Frequency_BodyGyroscope_Mean_Z`
  - `Time_BodyAccelerometerMagnitude_STD`

## Data Transformations
1. **Merging Datasets**: Combined training and test sets.
2. **Extracting Relevant Features**: Selected only mean and standard deviation measurements.
3. **Replacing Activity Codes**: Converted numeric activity labels to descriptive names.
4. **Renaming Variables**: Made variable names more descriptive and human-readable.
5. **Creating Tidy Dataset**: Computed the average of each feature for each activity and subject.

## Output File
- `tidy_dataset.txt`: Contains the cleaned and summarized dataset with averages for each activity and subject.

