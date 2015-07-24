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
4. merges the data to form one data set as a data frame with _10299 observables_ and _563 variables_ with the subject and activity ID in the first two columns
5. Renames the first two columns to __"Subject"__ and __"Activity"__
6. uses the `make.names()` to provide valid column names in order to avoid duplicates
7. sorts the data set for __"Subject"__ and __"Activity"__
8. extracts only the measurements on the mean and standard deviation for each measurement this is a data frame with _10299 observables_ and _88 variables_.
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

11. labels the measurement variables with more descriptive names
12. Creates an new data set containing the average of each measuremnt variable of the extracted data set from step 8. for each activity and each subject. The result is a data frame with _180 observables_ and _88 variables_.
13. writes a `tidy_dataset.txt`file with the dataset inside.

The 88 variables are:

```
[1] "Subject"                                                          
 [2] "Activity"                                                         
 [3] "Time.BodyAcceleration.Mean...X"                                   
 [4] "Time.BodyAcceleration.Mean...Y"                                   
 [5] "Time.BodyAcceleration.Mean...Z"                                   
 [6] "Time.GravityAcceleration.Mean...X"                                
 [7] "Time.GravityAcceleration.Mean...Y"                                
 [8] "Time.GravityAcceleration.Mean...Z"                                
 [9] "Time.BodyAccelerationDerivative.Mean...X"                         
[10] "Time.BodyAccelerationDerivative.Mean...Y"                         
[11] "Time.BodyAccelerationDerivative.Mean...Z"                         
[12] "Time.BodyAngularSpeed.Mean...X"                                   
[13] "Time.BodyAngularSpeed.Mean...Y"                                   
[14] "Time.BodyAngularSpeed.Mean...Z"                                   
[15] "Time.BodyAngularSpeedDerivative.Mean...X"                         
[16] "Time.BodyAngularSpeedDerivative.Mean...Y"                         
[17] "Time.BodyAngularSpeedDerivative.Mean...Z"                         
[18] "Time.BodyAccelerationMagnitude.Mean.."                            
[19] "Time.GravityAccelerationMagnitude.Mean.."                         
[20] "Time.BodyAccelerationDerivativeMagnitude.Mean.."                  
[21] "Time.BodyAngularSpeedMagnitude.Mean.."                            
[22] "Time.BodyAngularSpeedDerivativeMagnitude.Mean.."                  
[23] "Frequency.BodyAcceleration.Mean...X"                              
[24] "Frequency.BodyAcceleration.Mean...Y"                              
[25] "Frequency.BodyAcceleration.Mean...Z"                              
[26] "Frequency.BodyAcceleration.MeanFrequency...X"                     
[27] "Frequency.BodyAcceleration.MeanFrequency...Y"                     
[28] "Frequency.BodyAcceleration.MeanFrequency...Z"                     
[29] "Frequency.BodyAccelerationDerivative.Mean...X"                    
[30] "Frequency.BodyAccelerationDerivative.Mean...Y"                    
[31] "Frequency.BodyAccelerationDerivative.Mean...Z"                    
[32] "Frequency.BodyAccelerationDerivative.MeanFrequency...X"           
[33] "Frequency.BodyAccelerationDerivative.MeanFrequency...Y"           
[34] "Frequency.BodyAccelerationDerivative.MeanFrequency...Z"           
[35] "Frequency.BodyAngularSpeed.Mean...X"                              
[36] "Frequency.BodyAngularSpeed.Mean...Y"                              
[37] "Frequency.BodyAngularSpeed.Mean...Z"                              
[38] "Frequency.BodyAngularSpeed.MeanFrequency...X"                     
[39] "Frequency.BodyAngularSpeed.MeanFrequency...Y"                     
[40] "Frequency.BodyAngularSpeed.MeanFrequency...Z"                     
[41] "Frequency.BodyAccelerationMagnitude.Mean.."                       
[42] "Frequency.BodyAccelerationMagnitude.MeanFrequency.."              
[43] "Frequency.BodyBodyAccelerationDerivativeMagnitude.Mean.."         
[44] "Frequency.BodyBodyAccelerationDerivativeMagnitude.MeanFrequency.."
[45] "Frequency.BodyBodyAngularSpeedMagnitude.Mean.."                   
[46] "Frequency.BodyBodyAngularSpeedMagnitude.MeanFrequency.."          
[47] "Frequency.BodyBodyAngularSpeedDerivativeMagnitude.Mean.."         
[48] "Frequency.BodyBodyAngularSpeedDerivativeMagnitude.MeanFrequency.."
[49] "angle.tBodyAccelerationMean.gravity."                             
[50] "angle.tBodyAccelerationDerivativeMean..gravityMean."              
[51] "angle.tBodyAngularSpeedMean.gravityMean."                         
[52] "angle.tBodyAngularSpeedDerivativeMean.gravityMean."               
[53] "angle.X.gravityMean."                                             
[54] "angle.Y.gravityMean."                                             
[55] "angle.Z.gravityMean."                                             
[56] "Time.BodyAcceleration.Std.Deviation...X"                          
[57] "Time.BodyAcceleration.Std.Deviation...Y"                          
[58] "Time.BodyAcceleration.Std.Deviation...Z"                          
[59] "Time.GravityAcceleration.Std.Deviation...X"                       
[60] "Time.GravityAcceleration.Std.Deviation...Y"                       
[61] "Time.GravityAcceleration.Std.Deviation...Z"                       
[62] "Time.BodyAccelerationDerivative.Std.Deviation...X"                
[63] "Time.BodyAccelerationDerivative.Std.Deviation...Y"                
[64] "Time.BodyAccelerationDerivative.Std.Deviation...Z"                
[65] "Time.BodyAngularSpeed.Std.Deviation...X"                          
[66] "Time.BodyAngularSpeed.Std.Deviation...Y"                          
[67] "Time.BodyAngularSpeed.Std.Deviation...Z"                          
[68] "Time.BodyAngularSpeedDerivative.Std.Deviation...X"                
[69] "Time.BodyAngularSpeedDerivative.Std.Deviation...Y"                
[70] "Time.BodyAngularSpeedDerivative.Std.Deviation...Z"                
[71] "Time.BodyAccelerationMagnitude.Std.Deviation.."                   
[72] "Time.GravityAccelerationMagnitude.Std.Deviation.."                
[73] "Time.BodyAccelerationDerivativeMagnitude.Std.Deviation.."         
[74] "Time.BodyAngularSpeedMagnitude.Std.Deviation.."                   
[75] "Time.BodyAngularSpeedDerivativeMagnitude.Std.Deviation.."         
[76] "Frequency.BodyAcceleration.Std.Deviation...X"                     
[77] "Frequency.BodyAcceleration.Std.Deviation...Y"                     
[78] "Frequency.BodyAcceleration.Std.Deviation...Z"                     
[79] "Frequency.BodyAccelerationDerivative.Std.Deviation...X"           
[80] "Frequency.BodyAccelerationDerivative.Std.Deviation...Y"           
[81] "Frequency.BodyAccelerationDerivative.Std.Deviation...Z"           
[82] "Frequency.BodyAngularSpeed.Std.Deviation...X"                     
[83] "Frequency.BodyAngularSpeed.Std.Deviation...Y"                     
[84] "Frequency.BodyAngularSpeed.Std.Deviation...Z"                     
[85] "Frequency.BodyAccelerationMagnitude.Std.Deviation.."              
[86] "Frequency.BodyBodyAccelerationDerivativeMagnitude.Std.Deviation.."
[87] "Frequency.BodyBodyAngularSpeedMagnitude.Std.Deviation.."          
[88] "Frequency.BodyBodyAngularSpeedDerivativeMagnitude.Std.Deviation.."
```


