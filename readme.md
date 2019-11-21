---
title: "readme"
output: html_document
---




=========
Getting and Cleaning Data

Cmyse Project 

Alan Craig

 Overview
==========================================================================================================================

This README.md file documents the submission for the cmyse project for Getting and Cleaning data.

The cmyse project is based on the data and information available at the following URLs:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


==========================================================================================================================

Data 
==========================================================================================================================

All data is found in the .zip file at the second URL, above, and all data files from all folders of the .zip file
must be in the working directory in which run_analysis.R is run.

Please view thr Codebook file in this Repo for acomplete description of all the variables of the input files and all the
variables of the three key datasets that are generatd in this assignment project.

==========================================================================================================================

Process
==========================================================================================================================

 All work is accomplished by run_analysis.R, and this programme consists of 6 Phases which correpond to the project brief as follows:
 
 of the following steps of the cmyse project Instruction:

 1.Merge the training and the test sets to create one data set.  (My Phase 1-3)

 2.Extracts only the measurements on the mean and standard deviation for each measurement. (My Phase 4)

 3.Uses descriptive activity names to name the activities in the data set (My Phase 1 to Phase 5)

 4.Appropriately labels the data set with descriptive variable names. (My Phase 1 to Phase 5)

 5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
  (My Phase 5)

The 6 Phases of my run_analysis.R programme are as follows:

#Phase 1: Training data preparation into a consolidated Data frame
          #Step 1: Load all the input files for the featured data and identifier training dataset and process them        
          #Step 2: Load all the input data files for the inertia data and process them
          #Step 3: clean-up all the training data frames in preparation for combining into a single data frame
          #Step 4: check dimensions of all trianing data frames and then cbind into a single training dataset

#Phase 2: Test data preparation into a consolidated Data frame 
          #Step 1: Load all the input files for the featured data and identifier test dataset and process them          
          #Step 2: Load all the input data files for the inertia data and process them
          #Step 3: clean-up all the test data frames in preparation for combining into a single data frame
          #Step 4: check dimensions of all test data frames and then cbind into a single test dataset


#Phase 3: COmbine the training and test datasets into a signle combined dataset and clean up dataset
          #Step1: merge training and test datasets with row bind
          #Step2: Clean up the merged datasset and create new activity-name column from activity ID


#Phase 4: Create a second tidy dataset featuring only those variables with 'mean' or 'standard deviation' in their titles
          #step 1: filter in only those columns with mean or std
          #step 2: insert Observation number for dataset and add more meaningful data labels  


#phase 5:  creates a third tidy data set using dataset from Phase 3 with the average of each variable grouped by activity names subject    
          #step 1: Select only the numeric variables from the Dataset from Phase 3 and also select 'Activiyy name' and 'Subject
          #step 2: Take the mean of al the numeric varibles by 'Activiyy name' and 'Subject'


#phase 6: Export the Dataset from Phase 5 out to a 'txt' file 
          #Step 1: Export the 'tidy_final_set' dataset using the 'write.table' packaege
          
          
==========================================================================================================================
 
 
 
      

Tidy Dataset 1: Dataset named 'Dataset1_tidy_df'
==========================================================================================================================

Phases 1-3 prouces the firt tidy dataset required in the brief.The first tidy dataset was named 'Dataset1_tidy_df' and has the following characteristics:

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
    
    
    Process:
    
    
    The Dataset1_tidy_df dataset was created by combinng the training and test datasets from Phase 1  and     2 and then
    using a simple rbind function:
    
    Dataset1_tidy_df  <-  rbind( train_df   , test_df ) 
    
    
    
    Both the training and the test datasets needed to have the same number of columns and with the same       column names. This     was achieved with the following code blocks that altered the column names for      both training and test datasets:
    
    
            train_varname <- gsub("^t", "time_" ,train_varname) 
            train_varname <- gsub("^f", "freq_" ,train_varname) 
            train_varname <- gsub("BodyBody", "Body" ,train_varname) 
            train_varname <- gsub(",", "_" ,train_varname)
            train_varname <- gsub("\\()", " " ,train_varname) 
            train_varname <- gsub("\\ ", "" ,train_varname) 
            train_varname <- gsub("^angle\\(", "angle_" ,train_varname)
            train_varname <- gsub("\\)", "" ,train_varname)
            train_varname <- gsub(",", "_" ,train_varname) 
            train_varname  <-  toloIr(train_varname)
            train_varname  <-  gsub("std", "st_dev" ,train_varname) 
            train_varname  <-  gsub("-", "_" ,train_varname) 
            train_varname <-  gsub("angle_t", "angle_time_" ,train_varname  ) 
            train_varname <-  gsub("acc", "_acceler_" ,train_varname   ) 
            train_varname <-   gsub("mag", "_magnitude_" ,train_varname   ) 
            train_varname <-  gsub("__", "_" , train_varname    ) 
  
  
  
            test_varname <- gsub("^t", "time_" ,test_varname) 
            test_varname <- gsub("^f", "freq_" ,test_varname) 
            test_varname <- gsub("BodyBody", "Body" ,test_varname) 
            test_varname <- gsub(",", "_" ,test_varname)
            test_varname <- gsub("\\()", " " ,test_varname) 
            test_varname <- gsub("\\ ", "" ,test_varname) 
            test_varname <- gsub("^angle\\(", "angle_" ,test_varname)
            test_varname <- gsub("\\)", "" ,test_varname)
            test_varname <- gsub(",", "_" ,test_varname) 
            test_varname  <-  toloIr(test_varname)
            test_varname  <-  gsub("std", "st_dev" ,test_varname) 
            test_varname  <-  gsub("-", "_" ,test_varname) 
            test_varname <-  gsub("angle_t", "angle_time_" ,test_varname  ) 
            test_varname <-  gsub("acc", "_acceler_" ,test_varname   ) 
            test_varname <-   gsub("mag", "_magnitude_" ,test_varname   ) 
            test_varname <-  gsub("__", "_" , test_varname    ) 

  
            The dimennsions of both the train and test dataset Ire checked prior to using the rbind                  function as follows:
            
            dim(train_df)
            dim(test_df)
            
            
            The most complicated steps in generating the Dataset1_tidy_df dataset was in the reading in
            of the inertia data files. This was achieved by loading in all 9 of the inertia data files                using a regexpression function to select only those file names starting with 'body_' or       
            'total_' and ending in 'train.txt'. Next, a empty list is created and a for loop is used to               assign each of the 9 elements of the list with the existing column names from the original                input files.
            
            Then each list element is assigned a meaningful name starting with list element 1 =       
            'body_acc_x_train' up to list element 9 = total_acc_z_train and eachlist element is converted             to a data frame. Then all 9 dataframes nameae joined usign a cbind to form 1 new dataframe   
            called 'train_body_acc_x'. Finally, 9 for loops are used to provide each dataset with meaning 
            and unique names from the first column to the 128th column for each of the 9 merged data   
            frames.
            
            The code snipped below demonstrates how the 9 inertia data files Ire read in for the training             data and how each column name was given a meaningful column name and then joined to form a new             dataset that was then later merged into the final training dataset.
            
            #Step 2: Load all the input data files for the inertia data and process them

            Inertial_fnames <-    list.files(filedir, pattern = "^body_.*train.txt$|^total_.*train.txt$")
            Inertial_fnames
            ldf <- list()
            for (k in 1:length(Inertial_fnames)){
            ldf[[k]] <- read.table(Inertial_fnames[k])
            
            }
            #str(ldf[[1]])
            #ldf[[1]]
            Inertial_fnames 
            Inertial_fnames2  <- gsub(".txt", "" ,Inertial_fnames ) 
            names(ldf) <- Inertial_fnames2  # assign the list items with meaningful names
            
            #names(ldf[1])
            
            body_acc_x_train <- as.data.frame(ldf[[1]])
            body_acc_y_train <- as.data.frame(ldf[[2]])
            body_acc_z_train <- as.data.frame(ldf[[3]])
            body_gyro_x_train <- as.data.frame(ldf[[4]])
            body_gyro_y_train <- as.data.frame(ldf[[5]])
            body_gyro_z_train <- as.data.frame(ldf[[6]])
            total_acc_x_train <- as.data.frame(ldf[[7]])
            total_acc_y_train <- as.data.frame(ldf[[8]])
            total_acc_z_train <- as.data.frame(ldf[[9]])
            
            train_body_acc_x <- cbind(body_acc_x_train , body_acc_y_train , body_acc_z_train ,         
            body_gyro_x_train, body_gyro_y_train, body_gyro_z_train, total_acc_x_train , total_acc_y_train             , total_acc_z_train   )
            names(train_body_acc_x)
            
            
            inertial_col_names1 <- ""
            for (k in 1:ncol(body_acc_x_train)) {
            inertial_col_names1[k] <- paste("body_Accel_x_", k, sep = "")
            }
            
            
            inertial_col_names2 <- ""
            for (k in 1:ncol(body_acc_y_train)) {
            inertial_col_names2[k] <- paste("body_Accel_y_", k, sep = "")
            }
            
            inertial_col_names3 <- ""
            for (k in 1:ncol(body_acc_z_train)) {
            inertial_col_names3[k] <- paste("body_Accel_z_", k, sep = "")
            }
            
            
            
            inertial_col_names4 <- ""
            for (k in 1:ncol(body_gyro_x_train )) {
            inertial_col_names4[k] <- paste("body_gyro_x_", k, sep = "")
            }
            
            inertial_col_names5 <- ""
            for (k in 1:ncol(body_gyro_x_train)) {
            inertial_col_names5[k] <- paste("body_gyro_y_", k, sep = "")
            }
            
            inertial_col_names6 <- ""
            for (k in 1:ncol(body_gyro_x_train)) {
            inertial_col_names6[k] <- paste("body_gyro_z_", k, sep = "")
            }
            
            
            inertial_col_names7 <- ""
            for (k in 1:ncol(total_acc_x_train)) {
            inertial_col_names7[k] <- paste("total_accel_x_", k, sep = "")
            }
            
            inertial_col_names8 <- ""
            for (k in 1:ncol(total_acc_x_train)) {
            inertial_col_names8[k] <- paste("total_accel_y_", k, sep = "")
            }
            
            inertial_col_names9 <- ""
            for (k in 1:ncol(total_acc_x_train)) {
            inertial_col_names9[k] <- paste("total_accel_z_", k, sep = "")
            }
            
            
            
            inertial_col_names <- c(inertial_col_names1, inertial_col_names2 , inertial_col_names3 ,                  inertial_col_names4 , inertial_col_names5
            , inertial_col_names6 , inertial_col_names7 , inertial_col_names8 , inertial_col_names9)
            

  

==========================================================================================================================




Tidy Dataset 2: Dataset named 'Dataset2_tidy_df'
==========================================================================================================================


Phase 4 prouces the second tidy dataset, also called and 'extract' required in the brief. The purpose of this phase of the code was to filter down the dataset from Phase 3 (Dataset1_tidy_df), by only selecting those numeric columns with mean or standard deviation in their titles. The second dataset was named 'Dataset2_tidy_df' and has the following characteristics:


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
    
    
    process
    
    The first step in producing the Dataset2_tidy_df dataset was to select only those numeric columns with     mean or standard deviation in their titles using:
    
    #step 1 filter in only those columns with mean or std

    df_new_mean <- Dataset1_tidy_df[,grep("mean", names(Dataset1_tidy_df)   , value = FALSE) ]
    df_new_std <- Dataset1_tidy_df[,grep("st_dev", names(Dataset1_tidy_df)   , value = FALSE) ]
    
    
    These two datasets Ire then merged together with the first 4 columns of the Dataset1_tidy_df dataset     to form the Dataset2_tidy_df dataset.
    
    Dataset2_tidy_df <- cbind(Dataset1_tidy_df[,1:4], df_new_mean ,  df_new_std)
    
    
    Finaly, an observation column was added using the 'add_column' function from the 'tibble' package:
    
    ob_df <-   data.frame(length( Dataset2_tidy_df      ), 1)
    ob_df <-   seq.int(nrow(Dataset2_tidy_df))

    Dataset2_tidy_df <-add_column(Dataset2_tidy_df, obs_id = ob_df, .before = 1)  #insert new observation     id column using tibble package
    
    
    



==========================================================================================================================



Tidy Dataset 3: Dataset named 'tidy_final_set'
==========================================================================================================================

   
Phase 5 produces the third tidy dataset  required in the brief. The purpose of this phase of the code was to use the Dataset1_tidy_df datset and compute the mean for all the numeric columns grouped by the activity name and subject. The third dataset was named 'tidy_final_set' and has the following characteristics:
   
   
   
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
    
    
    process
    
    
    I use the aggregate() function to strike the means based on the grouping criteria in the                  instructions, passing activty number and subject to the by argument in a list, and passing 'mean'         to the FUN agrument.

  
    tidy_final_set <- aggregate(x =  t[, 3:ncol(t)],    by = list(t$activity_name,  t$subject_id),  FUN =     "mean",  na.rm = T)
 
     
    Finaly, using a for loop the column names of the dataset are suffixed with 'mean_of_' to reflect their     true meaning:
    
    for(i in 3:1715){
   
    names(tidy_final_set)[c(i)]  <-  paste("mean_of_",names(tidy_final_set)[c(i)],sep="")   
    }
    
    
    
==========================================================================================================================







Exporting the Text file: 'final_aggg_tidy_data_set.txt'
==========================================================================================================================


  In Phase 6, the last hase of code in 'run_analysis.R' I simply export the dataset from Phase 5 called     'tidy_final_set'to a text file called 'final_aggg_tidy_data_set.txt'
   
  #Step 1: Export the 'tidy_final_set' dataset using the 'write.table' packaege
   
           write.table(tidy_final_set, 
           file = "final_aggg_tidy_data_set.txt", 
           append = FALSE, 
           quote = FALSE, 
           sep = "\t",
           eol = "\n", 
           na = "NA", 
           dec = ".", 
           row.names = FALSE,
           col.names = TRUE
           
           )
    
    
    
==========================================================================================================================




###End of readme file#############

