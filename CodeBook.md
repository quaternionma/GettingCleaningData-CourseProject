#Code Book
---
### Description of the original Experiment and data set
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the 3-axial linear acceleration and 3-axial angular velocity are captured at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

###Reference
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. "Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine". _International Workshop of Ambient Assisted Living (IWAAL 2012)_. Vitoria-Gasteiz, Spain. __Dec 2012__

###Tidy Data Process description
The script `run_analysis.R` performs following procedural steps to generate the tidy data set:

1. loads the libraries `plyr` and `dplyr`
2. If the data isn't allready in a __dada__ folder in the working directory, the data set is downloaded from the provided URL and unzipped.
3. reads the training and test data along with the subject ID (volunteers' ID) and the activity ID
4. merges the data to form one data set with _10299 observables and 563 variables_ with the subject and activity ID in the first two columns
5. Renames the first two columns to __"Subject"__ and __"Activity"__
6. uses the `make.names()` to provide valid column names in order to avoid duplicates
7. sorts the data set for __"Subject"__ and __"Activity"__
8. extracts only the measurements on the mean and standard deviation for each measurement.
9. sets the variables __"Subject"__ and __"Activity"__ to factor variables
10. renames the activity ID to the corresponding activity name according to:

|ID | Activity |
----|-----------
| 1 | WALKING |
| 2 | WALKING_UPSTAIRS |
| 3 | WALKING_DOWNSTAIRS |
| 4 | SITTING |
| 5 | STANDING |
| 6 | LAYING |
