
######Programm stucture##################################

#Phase 1: Training data preparation into a consolidated Data frame
          #Step 1: Load all the input files for the featured data and identifuer training dataset and process them          
          #Step 2: Load all the input data files for the inertia data and process them
          #Step 3: clean-up all the training data frames in preparation for combining into a single data frame
          #Step 4: check dimensions of all trianing data frames and then cbind into a single trainign dataset

#Phase 2: Test data preparation into a consolidated Data frame 
          #Step 1: Load all the input files for the featured data and identifuer test dataset and process them          
          #Step 2: Load all the input data files for the inertia data and process them
          #Step 3: clean-up all the test data frames in preparation for combining into a single data frame
          #Step 4: check dimensions of all test data frames and then cbind into a single trainign dataset



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

##########################################################################################################################
        


#######
####################Phase 1: Training data preparation into a consolidated Data frame


#Step 1: Load all the input files for the featured data and identifuer training dataset and process them

library(dplyr)
install.packages("tibble")
library(tibble)
library(dataMaid)

library(knitr)


setwd("C:/Users/lisbo/OneDrive/IT Courses/JohnHopkins DS/Module3/assignment/alldata")
filedir <- "C:/Users/lisbo/OneDrive/IT Courses/JohnHopkins DS/Module3/assignment/alldata"


train_varname= as.vector(read.table("features.txt")[,2])

old_names_561 <- as.vector(read.table("features.txt")[,2])
train_features561<- read.table("X_train.txt"  )

train_subject_id<- read.table("subject_train.txt"  )
train_activity_id<- read.table("y_train.txt"  )


train_Exp_class  <-  data.frame(matrix( nrow=7352, ncol=1))  # new empty data frame for storiing the flag for 'training' or 'test' status or a row
names(train_Exp_class)[1] <- "exp_class"   #rename column
train_Exp_class[,1] <- 1  # all training rowa = 1


dim(train_varname)  
dim(train_features561)
dim(train_subject_id)
dim(train_activity_id)
dim(train_Exp_class)



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

train_body_acc_x <- cbind(body_acc_x_train , body_acc_y_train , body_acc_z_train , body_gyro_x_train, body_gyro_y_train, body_gyro_z_train, total_acc_x_train , total_acc_y_train , total_acc_z_train   )
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
  

  
  inertial_col_names <- c(inertial_col_names1, inertial_col_names2 , inertial_col_names3 , inertial_col_names4 , inertial_col_names5
                          , inertial_col_names6 , inertial_col_names7 , inertial_col_names8 , inertial_col_names9)
  inertial_col_names
  str(inertial_col_names)
  dim(train_body_acc_x)

  
  
  names(train_body_acc_x) <- inertial_col_names ##assign the column names to the train_body_acc_x dataset
  names(train_features561) <- tolower(train_varname)   ## assign names to the train_features561 dataset
  names(train_subject_id) <- "subject_id"
  names(train_activity_id) <- "activity_id"
  names(train_Exp_class) <- "exp_class"
  

#Step 3: clean-up all the training data frames in preparation for combining into a single data frame

  train_varname <- gsub("^t", "time_" ,train_varname) 
  train_varname <- gsub("^f", "freq_" ,train_varname) 
  train_varname <- gsub("BodyBody", "Body" ,train_varname) 
  train_varname <- gsub(",", "_" ,train_varname)
  train_varname <- gsub("\\()", " " ,train_varname) 
  train_varname <- gsub("\\ ", "" ,train_varname) 
  train_varname <- gsub("^angle\\(", "angle_" ,train_varname)
  train_varname <- gsub("\\)", "" ,train_varname)
  train_varname <- gsub(",", "_" ,train_varname) 
  train_varname  <-  tolower(train_varname)
  train_varname  <-  gsub("std", "st_dev" ,train_varname) 
  train_varname  <-  gsub("-", "_" ,train_varname) 
  train_varname <-  gsub("angle_t", "angle_time_" ,train_varname  ) 
  train_varname <-  gsub("acc", "_acceler_" ,train_varname   ) 
  train_varname <-   gsub("mag", "_magnitude_" ,train_varname   ) 
  train_varname <-  gsub("__", "_" , train_varname    ) 
  
  train_varname


###assign all tiy column names to data frames
names(train_body_acc_x) <- inertial_col_names ##assign the column names to the train_body_acc_x dataset
names(train_features561) <- tolower(train_varname)   ## assign names to the train_features561 dataset
names(train_subject_id) <- "subject_id"
names(train_activity_id) <- "activity_id"
names(train_Exp_class) <- "exp_class"



#Step 4: check dimensions of all trianing data frames and then cbind into a single trainign dataset

## check all training data frames have 7352 rowa
dim(train_body_acc_x)
dim(train_features561)
dim(train_subject_id)
dim(train_activity_id)
dim(train_Exp_class)


train_df <- cbind(train_subject_id  , train_activity_id  ,train_Exp_class     ,train_features561       ,train_body_acc_x)



#---Phase  2:  Test data preparation into a consolidated Data frame
############################
####################



#Step 1: Load all the input files for the featured data and identifuer test dataset and process them          


#download.file(fileURL, destfile = "./test_varnames.txt", method = "curl", extra='-L')
test_varname= as.vector(read.table("features.txt")[,2])

old_names_561 <- as.vector(read.table("features.txt")[,2])
test_features561<- read.table("X_test.txt"  )

test_subject_id<- read.table("subject_test.txt"  )
test_activity_id<- read.table("y_test.txt"  )


test_Exp_class  <-  data.frame(matrix( nrow=2947, ncol=1))  # new empty data frame for storiing the flag for 'testing' or 'test' status or a row
names(test_Exp_class)[1] <- "exp_class"   #rename column
test_Exp_class[,1] <- 2  # all test rows = 2


length(test_varname)  
dim(test_features561)
dim(test_subject_id)
dim(test_activity_id)
dim(test_Exp_class)


#Step 2: Load all the input data files for the inertia data and process them


Inertial_fnames <-    list.files(filedir, pattern = "^body_.*test.txt$|^total_.*test.txt$")
#Inertial_fnames
ldf <- list()

for (k in 1:length(Inertial_fnames)){
  ldf[[k]] <- read.table(Inertial_fnames[k])
  
}


Inertial_fnames2  <- gsub(".txt", "" ,Inertial_fnames ) 
names(ldf) <- Inertial_fnames2  # assign the list items with meaningful names


body_acc_x_test <- as.data.frame(ldf[[1]])
body_acc_y_test <- as.data.frame(ldf[[2]])
body_acc_z_test <- as.data.frame(ldf[[3]])
body_gyro_x_test <- as.data.frame(ldf[[4]])
body_gyro_y_test <- as.data.frame(ldf[[5]])
body_gyro_z_test <- as.data.frame(ldf[[6]])
total_acc_x_test <- as.data.frame(ldf[[7]])
total_acc_y_test <- as.data.frame(ldf[[8]])
total_acc_z_test <- as.data.frame(ldf[[9]])



test_body_acc_x <- cbind(body_acc_x_test , body_acc_y_test , body_acc_z_test , body_gyro_x_test, body_gyro_y_test, body_gyro_z_test , total_acc_x_test ,total_acc_y_test ,total_acc_z_test  )

#View(test_body_acc_x )


inertial_col_names1 <- ""
for (k in 1:ncol(body_acc_x_test)) {
  inertial_col_names1[k] <- paste("body_Accel_x_", k, sep = "")
}


inertial_col_names2 <- ""
for (k in 1:ncol(body_acc_y_test)) {
  inertial_col_names2[k] <- paste("body_Accel_y_", k, sep = "")
}

inertial_col_names3 <- ""
for (k in 1:ncol(body_acc_z_test)) {
  inertial_col_names3[k] <- paste("body_Accel_z_", k, sep = "")
}



inertial_col_names4 <- ""
for (k in 1:ncol(body_gyro_x_test )) {
  inertial_col_names4[k] <- paste("body_gyro_x_", k, sep = "")
}

inertial_col_names5 <- ""
for (k in 1:ncol(body_gyro_y_test)) {
  inertial_col_names5[k] <- paste("body_gyro_y_", k, sep = "")
}

inertial_col_names6 <- ""
for (k in 1:ncol(body_gyro_z_test)) {
  inertial_col_names6[k] <- paste("body_gyro_z_", k, sep = "")
}


inertial_col_names7 <- ""
for (k in 1:ncol(total_acc_x_test)) {
  inertial_col_names7[k] <- paste("total_accel_x_", k, sep = "")
}

inertial_col_names8 <- ""
for (k in 1:ncol(total_acc_y_test)) {
  inertial_col_names8[k] <- paste("total_accel_y_", k, sep = "")
}

inertial_col_names9 <- ""
for (k in 1:ncol(total_acc_z_test)) {
  inertial_col_names9[k] <- paste("total_accel_z_", k, sep = "")
}


inertial_col_names <- c(inertial_col_names1, inertial_col_names2 , inertial_col_names3 , inertial_col_names4 , inertial_col_names5
                        , inertial_col_names6 , inertial_col_names7 , inertial_col_names8 , inertial_col_names9)
inertial_col_names

str(inertial_col_names)
dim(test_body_acc_x)


names(test_body_acc_x) <- inertial_col_names ##assign the column names to the test_body_acc_x dataset
names(test_features561) <- tolower(test_varname)   ## assign names to the test_features561 dataset
names(test_subject_id) <- "subject_id"
names(test_activity_id) <- "activity_id"
names(test_Exp_class) <- "exp_class"


#Step 3: clean-up all the test data frames in preparation for combining into a single data frame


test_varname <- gsub("^t", "time_" ,test_varname) 
test_varname <- gsub("^f", "freq_" ,test_varname) 
test_varname <- gsub("BodyBody", "Body" ,test_varname) 
test_varname <- gsub(",", "_" ,test_varname)
test_varname <- gsub("\\()", " " ,test_varname) 
test_varname <- gsub("\\ ", "" ,test_varname) 
test_varname <- gsub("^angle\\(", "angle_" ,test_varname)
test_varname <- gsub("\\)", "" ,test_varname)
test_varname <- gsub(",", "_" ,test_varname) 
test_varname  <-  tolower(test_varname)
test_varname  <-  gsub("std", "st_dev" ,test_varname) 
test_varname  <-  gsub("-", "_" ,test_varname) 
test_varname <-  gsub("angle_t", "angle_time_" ,test_varname  ) 
test_varname <-  gsub("acc", "_acceler_" ,test_varname   ) 
test_varname <-   gsub("mag", "_magnitude_" ,test_varname   ) 
test_varname <-  gsub("__", "_" , test_varname    ) 

test_varname




###assign all tiy column names to data frames
names(test_body_acc_x) <- inertial_col_names ##assign the column names to the test_body_acc_x dataset
names(test_features561) <- tolower(test_varname)   ## assign names to the test_features561 dataset
names(test_subject_id) <- "subject_id"
names(test_activity_id) <- "activity_id"
names(test_Exp_class) <- "exp_class"


#Step 4: check dimensions of all test data frames and then cbind into a single trainign dataset

## check all testing data frames have 2947 rows
dim(test_body_acc_x)
dim(test_features561)
dim(test_subject_id)
dim(test_activity_id)
dim(test_Exp_class)


#combine datasets in the order: 1.

test_df <- cbind(test_subject_id, test_activity_id  ,test_Exp_class ,test_features561 , test_body_acc_x    )
  



#####################################
#########################
###############
#Phase 3:  COmbine the training and test datasets into a signle combined dataset and clean up dataset




###Step1: merge training and test datasets with row bind

names(train_df)
names(test_df)
dim(train_df)
dim(test_df)


  Dataset1_tidy_df  <-  rbind( train_df   , test_df )  
###Step2:  Clean up the merged datasset and create new activity-name column from activity ID
 
  Dataset1_tidy_df$activity_names <-ifelse(Dataset1_tidy_df$activity_id ==1, "WALKING",
                                           ifelse(Dataset1_tidy_df$activity_id ==2, "WALKING_UPSTAIRS",
                                             ifelse(Dataset1_tidy_df$activity_id ==3, "WALKING_DOWNSTAIRS",
                                                  ifelse(Dataset1_tidy_df$activity_id ==4, "SITTING"  ,
                                                           ifelse(Dataset1_tidy_df$activity_id ==5, "STANDING" , 
                                                           ifelse(Dataset1_tidy_df$activity_id ==6, "LAYING", NA) ) ) ) ) )
  
  
  
  #move "activity names" column to be the 3th column  from position 1717
  names(Dataset1_tidy_df)
  Dataset1_tidy_df  <- cbind(Dataset1_tidy_df[,1:2], Dataset1_tidy_df[,1717],   Dataset1_tidy_df[,3:1716])
  
  
  #library(dplyr)
  
  Dataset1_tidy_df <-
    Dataset1_tidy_df %>% 
    rename(
      activity_name = names(Dataset1_tidy_df[3])
 
      
    )
 
  
###########################################  
###########################################  
#Phase 4: Create a second tidy dataset featuring only those variables with 'mean' or 'standard deviation' in their titles

#step 1 filter in only those columns with mean or std

df_new_mean <- Dataset1_tidy_df[,grep("mean", names(Dataset1_tidy_df)   , value = FALSE) ]
df_new_std <- Dataset1_tidy_df[,grep("st_dev", names(Dataset1_tidy_df)   , value = FALSE) ]


##recombine new filteed data extract to make tidy dataset 2
Dataset2_tidy_df <- cbind(Dataset1_tidy_df[,1:4], df_new_mean ,  df_new_std)

names(head(Dataset1_tidy_df,10))
names(Dataset2_tidy_df)

dim(Dataset1_tidy_df)


# step 2 insert Observation number for dataset and add more meaningful data labels


ob_df <-   data.frame(length( Dataset2_tidy_df      ), 1)
ob_df <-   seq.int(nrow(Dataset2_tidy_df))

Dataset2_tidy_df <-add_column(Dataset2_tidy_df, obs_id = ob_df, .before = 1)  #insert new observation id column using tibble package


##############
###########################
#phase 5:  creates a third tidy data set using dataset from Phase 3 with the average of each variable grouped by activity names subject    

#step 1: Select only the numeric variables from the Dataset from Phase 3 and also select 'Activiyy name' and 'Subject'
   
 t<-  Dataset1_tidy_df[,c(1,3,5:1717)]  %>%
 group_by(activity_name , subject_id)

#step 2: Take the mean of al the numeric varibles by 'Activiyy name' and 'Subject'

 
 tidy_final_set <- aggregate(x =  t[, 3:ncol(t)],    by = list(t$activity_name,  t$subject_id),  FUN = "mean",  na.rm = T)
 
 
 ##tidy up columns names in tidy_final_set
 
 tidy_final_set <-
   tidy_final_set %>% 
   rename(
     activity_name = names( tidy_final_set[1]),
     subject_id = names( tidy_final_set[2])
     
   )

 
 ####clean up column names of the numeric variables in the tidy_final_set to reflect that it is an aggregate column of the mean
 
 for(i in 3:1715){
 #print ( names(tidy_final_set)[c(i)] )   <- 
   
   names(tidy_final_set)[c(i)]  <-  paste("mean_of_",names(tidy_final_set)[c(i)],sep="")   
 }
 
 
 tail(names(tidy_final_set), 800)
 dim(tidy_final_set)
 
 
 ################
 ####################phase 6: Export the Dataset from Phase 5 out to a 'txt' file 
 
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


##############END OF PROGRAMME######################################################################################
##############END OF PROGRAMME######################################################################################
##############END OF PROGRAMME######################################################################################
 
 
 
 
 
 
 
