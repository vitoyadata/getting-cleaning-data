# The codebook 

## info
Put the data into a 'data' folder.
The tidy data set is tidy_data.txt
tidy data is a table with dimensions 180 x 81. 
First column is the subject id.
Second column is the activity.
And the rest of columns have a compact name. Some hints: 
- Acc -> Accelerometer
- Gyro -> Gyroscope
- Mag -> Magnitude
- f - >Frequency
- t -> Time
- std -> Standard Deviation
- freq -> Frequency

## Steps:
1) Read the "features.txt".
2) Extract the wanted features.
3) Extract data train with only wanted features.
4) Extract data test with only wanted features.
5) Create a new data set with merges of the training and the test sets.
6) Put descriptive names activities.
7) Convert activity names into factors.
8) Export the tidyData -> "tidy_data.txt".