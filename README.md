Getting and Cleaning Data Course Project
========================================


## Project Description
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.
The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers
on a series of yes/no questions related to the project.

You will be required to submit:

1. a tidy data set as described below,
2. a link to a Github repository with your script for performing the analysis, and
3. a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.
   You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected. 

ne of the most exciting areas in all of data science right now is wearable computing - see for example this article. 
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users.
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.
A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## What you find in this repository
* __README.md__: this file
* __CodeBook.md__: Included are informations about the raw and the tidy dataset, the variable names and major process steps to get the tidy dataset.
* __run_analysis.R__: R script that runs the tidy data creation process.

## How the tidy dataset is created:

1. clone this repository https://github.com/quaternionma/GettingCleaningData-CourseProject.git to a working directory. Set this as the R working directory with `setwd()` or  
2. source the run_analisys.R script (it requires the plyr an dplyr packages) with `source('path_to/run_analysis.R', chdir = TRUE)`

3. In the working directory you'll find the file `tidy_dataset.txt` with the tidy data set in it.

__Note:__ The run_analisys.R script retrieves the actual working directory, creates a directory "data" in it,
downloads the file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, unzips the file in to the data directory and finally deletes the zip file.
