---
title: "Code book"
author: "Singappuli Perera"
date: "Saturday, March 21, 2015"
output: word_document
---

#Raw data collection
#Collection
Raw data are obtained from UCI Machine Learning repository. In particular, Human Activity Recognition Using Smartphones Data Set [1], which was derived by carrying experiments on 30 volunteers within the age of 19-40 years. Each person performed six activities (walking, walking upstairs, walking downstairs, sitting, standing, laying) wearing a smartphone (Samsung Galaxy S II) on the waist[2].

 The collectors used a sensor based approach employing smartphones as sensing tools. Smartphones are an effective solution for AR, because they come with embedded built-in sensors such as microphones, dual cameras, accelerometers, gyroscopes, etc.Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz[2]. The experiments have been video-recorded to label the data manually [3].
 
The Dataset is converted to sub data that contains 563 columns and 6106 rows (approx 60%) of the original Data available. The original column names of the features of the Data were renamed to v1,v2...v561 for convenience. Each such row of observation also contained the Id number of the volunteer ranging from 1 to 30. The obtained data set has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

#Feature Selection 
The following description is able to find from the features info.txt file in the original dataset to learn more about the feature selection for this dataset. The following is the link to the URL:(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

According to the descriprtion, the features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, 
The set of variables that were estimated from signals are: 
  mean(): Mean value
	std(): Standard deviation
	mad(): Median absolute deviation 
	max(): Largest value in array
	min(): Smallest value in array
	sma(): Signal magnitude area
	energy(): Energy measure. Sum of the squares divided by the number of values. 
	iqr(): Interquartile range 
	entropy(): Signal entropy
	arCoeff(): Autoregression coefficients with Burg order equal to 4
	correlation(): Correlation coefficient between two signals
	maxInds(): Index of the frequency component with largest magnitude
	meanFreq(): Weighted average of the frequency components to obtain a mean frequency
	skewness(): Skewness of the frequency domain signal 
	kurtosis(): Kurtosis of the frequency domain signal 
	bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each   window.
angle(): Angle between some vectors.

No unit of measures is reported as all features were normalized and bounded within [-1,1].

#Data transformation
The raw data sets are processed with run_analisys.R script to create a tidy data set.
Merge training and test sets
First, all test(X_test, subject_test,y_test) and train sets(X_train, subject_train, y_train) are merged separately by using cbind command in R and then rbind those train and test to obtain a single data set. 

#Extract mean and standard deviation variables
From the merged data set kept features that represent values of estimated mean (variables with labels that contain "mean") and standard deviation (variables with labels that contain "std"). Then selected the features we want from the features dataset.

#Create a tidy data set
From the intermediate data set, a final tidy data set where numeric variables are averaged for each activity and each subject.
The tidy data set contains 180 observations with 88 variables divided in:
•	an activity label (Activity): WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
•	an identifier of the subject who carried out the experiment (Subject): 1-30
•	a 88-feature vector with time and frequency domain signal variables (numeric)

#References
1.	Human Activity Recognition Using Smartphones Data Set. URL: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. Accessed 03/16/2015
2.	Harjot Singh Parmar, Human Activity Recognition using Machine Learning Techniques URL: http://www.academia.edu/7619059/Human_Activity_Recognition_using_machine_learning.  Accessed 03/16/2015
3.	Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine.  International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.
4.	Activity recognition. URL: http://en.wikipedia.org/wiki/Activity_recognition. Accessed 03/16/2015
5.	Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. ESANN 2013 proceedings, European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning. Bruges (Belgium), 24-26 April 2013
6.	Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. Human Activity Recognition Using Smartphones Dataset. UCI Machine Learning Repository. 10 Dec 2012. http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
7.	Tidy data set. URL: https://github.com/jtleek/datasharing#the-tidy-data-set. Accessed 03/16/2015
