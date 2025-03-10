# Human Activity Recognition Using Smartphones - Data Cleaning Project

## Overview
This project is part of the Data Science course, demonstrating data collection, cleaning, and preparation for analysis. The dataset used is the Human Activity Recognition Using Smartphones dataset.

## Files Included
- `run_analysis.R`: Script that processes the dataset.
- `tidy_dataset.txt`: The final tidy dataset.
- `CodeBook.md`: Describes variables, transformations, and data processing steps.
- `README.md`: This file, explaining the project and script execution.

## Steps Performed
1. **Download and extract data** from the provided URL.
2. **Merge training and test datasets** to create one dataset.
3. **Extract only measurements of mean and standard deviation** for each feature.
4. **Replace activity codes with descriptive activity names**.
5. **Label dataset with appropriate variable names**.
6. **Create a second independent tidy dataset** with the average of each variable for each activity and subject.
7. **Save the cleaned dataset** as `tidy_dataset.txt`.

## How to Run the Script
1. Ensure you have R installed with the `dplyr` package.
2. Place `run_analysis.R` in your working directory.
3. Run the script in R:
   ```r
   source("run_analysis.R")
   ```
4. The output file `tidy_dataset.txt` will be generated in your working directory.

