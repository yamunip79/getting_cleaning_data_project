---
title: "README.MD"
author: "Singappuli Perera"
date: "Saturday, March 21, 2015"
output: word_document
---
#Getting and Cleaning Data: Course Project

#Introduction
This repository contains my work for the course project for the Coursera course "Getting and Cleaning data" as a part of the Data Science specialization. 

#The raw data
The features (561) are unlabeled and can be found in the X_test.txt and X_train.txt files.  Similarly, the activity labels are in the y_test.txt file and y_train.txt for test and training as well as the test and train subjects are in the subject_test.txt file subject_ train.txt.

#About the script and the tidy dataset
A script called run_analysis.R which will merge the test and train sets together is created. The UCI HAR Dataset is downloaded and extracted from the course web site and the UCI HAR Dataset is available in a directory called "UCI HAR Dataset"
After merging test and train, labels are added and only columns that have to do with mean and standard deviation are kept.
Finally, the script will create a tidy data set which contains the means of all the columns per test subject and per activity. This tidy dataset will be written to a file called tidy.txt, which can also be found in this repository.

#About the Code Book
The CodeBook.md file gives the information about raw data, the names of labels used in the data set, explanation of the transformations performed and the resulting data and variables.
