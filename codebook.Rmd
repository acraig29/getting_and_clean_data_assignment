---
title: "codebook"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown

The data for this project come from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#.

    Human Activity Recognition Using Smartphones Data Set 
    Download: Data Folder, Data Set Description
    
    Abstract: Human Activity Recognition database built from the recordings of 30 subjects performing 
    activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial 
    sensors.
    
    Data Set Characteristics:  
     
    Multivariate, Time-Series
     
    Number of Instances: 10299
     
    Area: Computer

    Attribute Characteristics:  N/A
     
    Number of Attributes: 561
     
    Date Donated 2012-12-10
            
    Associated Tasks: Classification, Clustering
     
    Missing Values? N/A         
    
    Smyce:
    
    Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. 
    Smartlab - Non Linear Complex Systems Laboratory 
    DITEN - UniversitÃ  degli Studi di Genova, Genoa I-16145, Italy. 
    activityrecognition '@' smartlab.ws 
    www.smartlab.ws 
Data Set Information:

Experiments Ire carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) Iaring a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, I captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) Ire pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Attribute Information:

For each record in the dataset it is provided:

Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
Triaxial Angular velocity from the gyroscope.
A 561-feature vector with time and frequency domain variables.
Its activity label.
An identifier of the subject who carried out the experiment.
Citation: This overview is by way of the following smyces:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. Smartlab - Non Linear Complex Systems Laboratory DITEN - UniversitÃ degli Studi di Genova, Genoa I-16145, Italy. activityrecognition '@' smartlab.ws www.smartlab.ws

Detailed Data Inventory
Data Shared by Test and Train
    Smyce File             Data Description
    
    activity_labels.txt     Names of activities, to be looked up based on activity 
                            numbers in the y_test.txt file
    
    features.txt            Feature names related to the columns of the x_test data
                            This file lists feature names down its first column, and 
                            these names must be used horizontally across the 
                            x_test.txt and x_train.txt data, below, as column names.
Test Measurement Data
The following data are summarized in Measurement Data Summary, below.

     Smyce File            Data Description

     body_acc_x_test.txt    Body acceleration x-axis data related to rows of test data
     body_acc_y_test.txt    Body acceleration y-axis data related to rows of test data
     body_acc_z_test.txt    Body acceleration z-axis data related to rows of test data
     body_gyro_x_test.txt   Body gyroscopic x-axis data related to rows of test data
     body_gyro_y_test.txt   Body gyroscopic y-axis data related to rows of test data
     body_gyro_z_test.txt   Body gyroscopic z-axis data related to rows of test data
     total_acc_x_test.txt   Total acceleration x-axis data related to rows of test data
     total_acc_y_test.txt   Total acceleration y-axis data related to rows of test data 
     total_acc_z_test.txt   Total acceleration z-axis data related to rows of test data
Test Analysis Data
The following data are summarized in Analysis Data Summary, below.

     Smyce File            Data Description
    
     subject_test.txt       Identifier numbers of subjects (people) related to rows of test data
                            One row for each row of feature data from x_test.txt
                            Add to feature data by cbind
     
     y_test.txt             Identifier numbers of actvities related to rows of test data
                            One row for each row of feature data from x_test.txt
                            These numbers are used to look up activity names that 
                            are in the variable called activity_labels which comes 
                            from activity_labels.txt
     
     x_test.txt             561-column-wide test data described in Analysis Data Summary, below 
                            These are the data that go in the columns named in 
                            features.txt, above, and are the results of analysis 
                            on the observation vectors in the body_ and total_ files 
                            below in Test Measurement Data.
Train Measurement Data
The following data are summarized in Measurement Data Summary, below.

     Smyce File            Data Description

     body_acc_x_train.txt   Body acceleration x-axis data related to rows of train data
     body_acc_y_train.txt   Body acceleration y-axis data related to rows of train data
     body_acc_z_train.txt   Body acceleration z-axis data related to rows of train data
     body_gyro_x_train.txt  Body gyroscopic x-axis data related to rows of train data
     body_gyro_y_train.txt  Body gyroscopic y-axis data related to rows of train data
     body_gyro_z_train.txt  Body gyroscopic z-axis data related to rows of train data
     total_acc_x_train.txt  Total acceleration x-axis data related to rows of train data
     total_acc_y_train.txt  Total acceleration y-axis data related to rows of train data 
     total_acc_z_train.txt  Total acceleration z-axis data related to rows of train data
     
     
     
Train Analysis Data
The following data are summarized in Analysis Data Summary, below.

     Smyce File            Data Description
     
     subject_train.txt      Identifier numbers of subjects (people) related to rows of train data. 
                            One row for each row of feature data from x_train.txt
     
     y_train.txt            Identifier numbers of actvities related to rows of train data
                            One row for each row of feature data from x_train.txt
                                                            
     x_train.txt            561-column-wide train data described in Analysis Data Summary, below 
                            These are the data that go in the columns named in 
                            features.txt, above, and are the results of analysis 
                            on the observation vectors in the body_ and total_ 
                            files below in Train Measurement Data.
Measurement Data Summary
The following summarizes how the measurement data Ire obtained.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) Iaring a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, I captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually.

The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data, resulting in nine unique subjects for the test data, and 21 unique subjects for the train data.

The sensor signals (accelerometer and gyroscope) Ire pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used.

This approach results in one data file each for accelerometer and gyroscope data for each of three axes, labeled, x, y, and z, for a total of six measurement data files. Additionally, the provider summarized accelration totals for each of the three access, resulting in nine total files for test and nine total files for train, each of which contains 128 variables of unspecified information.

Analysis Data Summary
my deliverable data set is predicated on the following data structure.

From each window created in the measurement process above, a vector of features was obtained by calculating variables from the time and frequency domain.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) Ire captured at a constant rate of 50 Hz. Then they Ire filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity Ire derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals Ire calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fmyier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals Ire used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

     tBodyAcc-XYZ
     tGravityAcc-XYZ
     tBodyAccJerk-XYZ
     tBodyGyro-XYZ
     tBodyGyroJerk-XYZ
     tBodyAccMag
     tGravityAccMag
     tBodyAccJerkMag
     tBodyGyroMag
     tBodyGyroJerkMag
     fBodyAcc-XYZ
     fBodyAccJerk-XYZ
     fBodyGyro-XYZ
     fBodyAccMag
     fBodyAccJerkMag
     fBodyGyroMag
     fBodyGyroJerkMag 
The set of variables that Ire estimated from these signals are:

     mean(): Mean value
     std(): Standard deviation
     mad(): Median absolute deviation 
     max(): Largest value in array
     min(): Smallest value in array
     sma(): Signal magnitude area
     energy(): Energy measure. Sum of the squares divided by the number of values. 
     iqr(): Interquartile range 
     entropy(): Signal entropy
     arCoeff(): Autorregresion coefficients with Burg order equal to 4
     correlation(): correlation coefficient betIen two signals
     maxInds(): index of the frequency component with largest magnitude
     meanFreq(): Iighted average of the frequency components to obtain a mean frequency
     skewness(): skewness of the frequency domain signal 
     kurtosis(): kurtosis of the frequency domain signal 
     bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
     angle(): Angle betIen to vectors.
Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

     gravityMean
     tBodyAccMean
     tBodyAccJerkMean
     tBodyGyroMean
     tBodyGyroJerkMean


Summary of Data Merge
my deliverable requires us to consolidate the data provided into one data set. I do this by re-combining the data along its normal dimensions, outlined above, so that I have named activities and commensurable variable names across test and train, and so I can associate measurement data with analsyis data in the same observation, or row, of the merged data set.

First Tidy dataset - Data merge
==============================

The resulting first tidy dataset of merging the training and tst has these characteristics:

  Column Name                             Column Number           Smyce
    
    subject_id                              1                       subject     id
    activity_id                             2                       activity number
    activity_name                           3                       activity_labels
    exp_class                               4                       train/test class
    
    561 feature columns                     5 - 564                 x_test/train
    
    body_Accel_x                            565 - 692               body_acc_x_test/train   
    body_Accel_y                            693 - 821               body_acc_y_test/train
    body_Accel_z                            822 - 949               body_acc_z_test/train
    body_gryro_x                            950 - 1077              body_gyro_x_test/train            
    body_gryro_y                            1076 - 1205             body_gyro_y_test/train          
    body_gryro_z                            1206 - 1333             body_gyro_z_test/train          
    total_accel_x                           1334 - 1461             total_acc_x_test/train           
    total_accel_y                           1462 - 1589             total_acc_y_test/train        
    total_accel_z                           1590 - 1717             total_acc_z_test/train            
    
    The row counts are as follows:
    
    Data Type                               Row Count
    
    Test                                     2,947
    Train                                    7,352
    
    Total Row Count                         10,299
    
    Total dimensions of the intial merge of the data in the .zip file is 10,299 rows and 1,717 columns.
    
    
    
    
    Total dimensions of the intial merge of the data in the .zip file is 10,299 rows and 1,717 columns.


Summary of Extract
For the creation of my extract of columns containing means and standard deviations, I relied on the information in Analysis Data Summary, above, and subsetted the merged data set by selecting those measurement and analysis data columns that contained the string 'mean' or the string 'std'.

Second Tidy dataset Extract
============================

For the creation of my extract of columns containing means and standard deviations, I relied on the information in Analysis Data Summary, above, and subsetted the merged data set by selecting those measurement and analysis data columns that contained the string 'mean' or the string 'std'.

This resulted in an extract data set, first_tidy_data_set, having the following characteristics.

                                                      Column 
    Column Name                                       Number                    Smyce

    obs_id                                              1             artificial column smyced from number rows
    subject_id                                          2             subjects_test/train
    activity_id                                         3             y_test/train
    activity_name                                       4             activity_labels 
    exp_class                                           5             Hard coded based on data smyce
    time_body_acceler_mean_x                            6             x_test/train
    time_body_acceler_mean_y                            7             x_test/train
    time_body_acceler_mean_z                            8             x_test/train
    time_gravity_acceler_mean_x                         9             x_test/train
    time_gravity_acceler_mean_y                         10            x_test/train
    time_gravity_acceler_mean_z                         11            x_test/train
    time_body_acceler_jerk_mean_x                       12            x_test/train
    time_body_acceler_jerk_mean_y                       13            x_test/train
    time_body_acceler_jerk_mean_z                       14            x_test/train
    time_bodygyro_mean_x                                15            x_test/train
    time_bodygyro_mean_y                                16            x_test/train
    time_bodygyro_mean_z                                17            x_test/train
    time_bodygyrojerk_mean_x                            18            x_test/train
    time_bodygyrojerk_mean_y                            19            x_test/train
    time_bodygyrojerk_mean_z                            20            x_test/train 
    time_body_acceler_magnitude_mean                    21            x_test/train
    time_gravity_acceler_magnitude_mean                 22				    x_test/train
    time_body_acceler_jerk_magnitude_mean               23            x_test/train
    time_bodygyro_magnitude_mean                        24            x_test/train
    time_bodygyrojerk_magnitude_mean                    25            x_test/train
    freq_body_acceler_mean_x                            26            x_test/train
    freq_body_acceler_mean_y                            27            x_test/train
    freq_body_acceler_mean_z                            28            x_test/train
    freq_body_acceler_meanfreq_x                        29				    x_test/train
    freq_body_acceler_meanfreq_y                        30            x_test/train
    freq_body_acceler_meanfreq_z                        31            x_test/train
    freq_body_acceler_jerk_mean_x                       32            x_test/train
    freq_body_acceler_jerk_mean_y                       33            x_test/train
    freq_body_acceler_jerk_mean_z                       34            x_test/train
    freq_body_acceler_jerk_meanfreq_x                   35            x_test/train
    freq_body_acceler_jerk_meanfreq_y                   36            x_test/train
    freq_body_acceler_jerk_meanfreq_z                   37            x_test/train
    freq_bodygyro_mean_x                                38            x_test/train
    freq_bodygyro_mean_y                                39            x_test/train
    freq_bodygyro_mean_z                                40            x_test/train
    freq_bodygyro_meanfreq_x                            41            x_test/train
    freq_bodygyro_meanfreq_y                            42            x_test/train
    freq_bodygyro_meanfreq_z                            43            x_test/train
    freq_body_acceler_magnitude_mean                    44            x_test/train
    freq_body_acceler_magnitude_meanfreq                45            x_test/train
    freq_body_acceler_jerk_magnitude_mean               46            x_test/train
    freq_body_acceler_jerk_magnitude_meanfreq           47            x_test/train
    freq_bodygyro_magnitude_mean                        48            x_test/train
    freq_bodygyro_magnitude_meanfreq                    49            x_test/train
    freq_bodygyrojerk_magnitude_mean                    50            x_test/train
    freq_bodygyrojerk_magnitude_meanfreq                51            x_test/train
    angle_time_body_acceler_mean_gravity                52            x_test/train
    angle_time_body_acceler_jerkmean_gravitymean        53            x_test/train
    angle_time_bodygyromean_gravitymean                 54            x_test/train
    angle_time_bodygyrojerkmean_gravitymean             55            x_test/train
    angle_x_gravitymean                                 56            x_test/train
    angle_y_gravitymean                                 57            x_test/train
    angle_z_gravitymean                                 58            x_test/train
    time_body_acceler_st_dev_x                          59            x_test/train
    time_body_acceler_st_dev_y                          60            x_test/train
    time_body_acceler_st_dev_z                          61            x_test/train
    time_gravity_acceler_st_dev_x                       62            x_test/train
    time_gravity_acceler_st_dev_y                       63            x_test/train
    time_gravity_acceler_st_dev_z                       64            x_test/train
    time_body_acceler_jerk_st_dev_x                     65            x_test/train
    time_body_acceler_jerk_st_dev_y                     66		        x_test/train
    time_body_acceler_jerk_st_dev_z                     67		        x_test/train    
    time_bodygyro_st_dev_x                              68		        x_test/train
    time_bodygyro_st_dev_y                              69		        x_test/train
    time_bodygyro_st_dev_z                              70		        x_test/train
    time_bodygyrojerk_st_dev_x                          71		        x_test/train
    time_bodygyrojerk_st_dev_y                          72		        x_test/train
    time_bodygyrojerk_st_dev_z                          73		        x_test/train
    time_body_acceler_magnitude_st_dev                  74		        x_test/train
    time_gravity_acceler_magnitude_st_dev               75	          x_test/train
    time_body_acceler_jerk_magnitude_st_dev             76	          x_test/train
    time_bodygyro_magnitude_st_dev                      77	          x_test/train
    time_bodygyrojerk_magnitude_st_dev                  78	          x_test/train
    freq_body_acceler_st_dev_x                          79		        x_test/train
    freq_body_acceler_st_dev_y                          80		        x_test/train
    freq_body_acceler_st_dev_z                          81			      x_test/train
    freq_body_acceler_jerk_st_dev_x                     82		        x_test/train
    freq_body_acceler_jerk_st_dev_y                     83	          x_test/train
    freq_body_acceler_jerk_st_dev_z                     84		        x_test/train
    freq_bodygyro_st_dev_x                              85			      x_test/train
    freq_bodygyro_st_dev_y                              86		        x_test/train
    freq_bodygyro_st_dev_z                              87	          x_test/train  
    freq_body_acceler_magnitude_st_dev                  88	          x_test/train
    freq_body_acceler_jerk_magnitude_st_dev             89		        x_test/train
    freq_bodygyro_magnitude_st_dev                      90		        x_test/train
    freq_bodygyrojerk_magnitude_st_dev                  91		        x_test/train  

    
    The row counts are as follows:
    
    Data Type                               Row Count
    
    Test                                     2,947
    Train                                    7,352
    
    Total Row Count                         10,299
    
    Total dimensions of the extract of means and standard deviations is 10,299 rows and 91 columns.


Summary of Deliverable
my approach to this takes the domain of data as all-inclusive, as there is no restriction in the instruction. Therefore, for the deliverable, second_independent_tidy_data_set, I began with the data in the merge data set.

my approach also makes the inferrence that the instruction intends to convey that I strike the mean of each variable for every unique combination of activity and subject, as the alternative data structure of combining domain-wide means for each activity with separate domain-wide means for each subject into one data set would appear to lack any rational purpose.

Aggregate() -- I use the aggregate() function to strike the means based on the grouping criteria in the instructions, passing activty number and subject to the by argument in a list, and passing 'mean' to the FUN agrument.

     '''{r}
     tidy_final_set <- aggregate(x =  t[, 3:ncol(t)],    by = list(t$activity_name,  t$subject_id),  FUN = "mean",  na.rm = T)
 
     '''

The column names to reflect that the values are mean averages.


Final Tidy dataset - Mean variables
===================================

    column Name                         Column Number                 Smyce

    activity_name                           1                       activity_labels assigned based on  the  Activity Number
    subject_id                              2                       subjects_test/train
    
    Means of 561 feature columns            3 - 563                 x_test/train (See Appendix)
    
    mean_of_body_Accel_x                    564 - 691               body_acc_x_test/train
    mean_of_body_Accel_y                    692 - 819               body_acc_y_test/train
    mean_of_body_Accel_z                    820 - 947               body_acc_z_test/train
    mean_of_body_gyro_x                     948 - 1075              body_gyro_x_test/train
    mean_of_body_gyro_y                     1076 - 1203             body_gyro_y_test/train
    mean_of_body_gyro_z                     1204 - 1331             body_gyro_z_test/train
    mean_of_total_accel_x                   1332 - 1459             total_acc_x_test/train
    mean_of_total_accel_y                   1460 - 1587             total_acc_y_test/train
    mean_of_total_accel_z                   1588 - 1715             total_acc_z_test/train
    
    
    The row counts are as follows: 30 subjects and six actvities produce rows for 180 unique combinations
    of activities and subjects.
    
    The total dimensions of the second independent tidy data set of mean variables by activity and subject
    are 180 rows and 1,715 columns.





###End of codebook file#############



 

       



