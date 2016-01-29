
#Code Book
The Tidy data set contains 180 observations across 81 features listed below:

* subjectid: integer, ranges from 1 to 30, it represents the Subject ID participating in the Wearable Study
* activityname: string, represents the various activities performed by the subjects. The activityname values include:
  * WALKING 
  * WALKING UPSTAIRS 
  * WALKING DOWNSTAIRS
  * SITING
  * STANDING
  * LAYING
  
The following 79 numeric features represent the average of measurements grouped by activityname and subjectid.
  
Time domain fetrues (Numeric):
* AVGOf timedomain_bodyacc_meanx                 
* AVGOf timedomain_bodyacc_meany                
* AVGOf timedomain_bodyacc_meanz                 
* AVGOf timedomain_bodyacc_stdx                  
* AVGOf timedomain_bodyacc_stdy                  
* AVGOf timedomain_bodyacc_stdz                 
* AVGOf timedomain_gravityacc_meanx              
* AVGOf timedomain_gravityacc_meany             
* AVGOf timedomain_gravityacc_meanz             
* AVGOf timedomain_gravityacc_stdx              
* AVGOf timedomain_gravityacc_stdy               
* AVGOf timedomain_gravityacc_stdz               
* AVGOf timedomain_bodyaccjerk_meanx             
* AVGOf timedomain_bodyaccjerk_meany            
* AVGOf timedomain_bodyaccjerk_meanz            
* AVGOf timedomain_bodyaccjerk_stdx            
* AVGOf timedomain_bodyaccjerk_stdy              
* AVGOf timedomain_bodyaccjerk_stdz             
* AVGOf timedomain_bodygyro_meanx               
* AVGOf timedomain_bodygyro_meany                
* AVGOf timedomain_bodygyro_meanz                
* AVGOf timedomain_bodygyro_stdx                
* AVGOf timedomain_bodygyro_stdy                 
* AVGOf timedomain_bodygyro_stdz                 
* AVGOf timedomain_bodygyrojerk_meanx            
* AVGOf timedomain_bodygyrojerk_meany           
* AVGOf timedomain_bodygyrojerk_meanz           
* AVGOf timedomain_bodygyrojerk_stdx             
* AVGOf timedomain_bodygyrojerk_stdy             
* AVGOf timedomain_bodygyrojerk_stdz            
* AVGOf timedomain_bodyaccmag_mean             
* AVGOf timedomain_bodyaccmag_std                
* AVGOf timedomain_gravityaccmag_mean            
* AVGOf timedomain_gravityaccmag_std            
* AVGOf timedomain_bodyaccjerkmag_mean           
* AVGOf timedomain_bodyaccjerkmag_std            
* AVGOf timedomain_bodygyromag_mean            
* AVGOf timedomain_bodygyromag_std         
* AVGOf timedomain_bodygyrojerkmag_mean    
* AVGOf timedomain_bodygyrojerkmag_std

 Frequency domain features (Numeric):
* AVGOf freqdomain_bodyacc_meanx            
* AVGOf freqdomain_bodyacc_meany                
* AVGOf freqdomain_bodyacc_meanz                 
* AVGOf freqdomain_bodyacc_stdx                  
* AVGOf freqdomain_bodyacc_stdy                  
* AVGOf freqdomain_bodyacc_stdz                 
* AVGOf freqdomain_bodyacc_meanfreqx             
* AVGOf freqdomain_bodyacc_meanfreqy             
* AVGOf freqdomain_bodyacc_meanfreqz             
* AVGOf freqdomain_bodyaccjerk_meanx            
* AVGOf freqdomain_bodyaccjerk_meany             
* AVGOf freqdomain_bodyaccjerk_meanz             
* AVGOf freqdomain_bodyaccjerk_stdx            
* AVGOf freqdomain_bodyaccjerk_stdy             
* AVGOf freqdomain_bodyaccjerk_stdz              
* AVGOf freqdomain_bodyaccjerk_meanfreqx         
* AVGOf freqdomain_bodyaccjerk_meanfreqy         
* AVGOf freqdomain_bodyaccjerk_meanfreqz        
* AVGOf freqdomain_bodygyro_meanx                
* AVGOf freqdomain_bodygyro_meany        
* AVGOf freqdomain_bodygyro_meanz                
* AVGOf freqdomain_bodygyro_stdx                
* AVGOf freqdomain_bodygyro_stdy                
* AVGOf freqdomain_bodygyro_stdz                
* AVGOf freqdomain_bodygyro_meanfreqx            
* AVGOf freqdomain_bodygyro_meanfreqy           
* AVGOf freqdomain_bodygyro_meanfreqz            
* AVGOf freqdomain_bodyaccmag_mean            
* AVGOf freqdomain_bodyaccmag_std              
* AVGOf freqdomain_bodyaccmag_meanfreq          
* AVGOf freqdomain_body_bodyaccjerkmag_mean      
* AVGOf freqdomain_body_bodyaccjerkmag_std      
* AVGOf freqdomain_body_bodyaccjerkmag_meanfreq  
* AVGOf freqdomain_body_bodygyromag_mean  
* AVGOf freqdomain_body_bodygyromag_std          
* AVGOf freqdomain_body_bodygyromag_meanfreq     
* AVGOf freqdomain_body_bodygyrojerkmag_mean     
* AVGOf freqdomain_body_bodygyrojerkmag_std     
* AVGOf freqdomain_body_bodygyrojerkmag_meanfreq

##run_analysis.R Script Documentation
The structure and data transformations contained in the run_analysis.R script are described below.

* Step: 1 - Merge the training and the test data sets to create one data set
Set the working directory for the R session:
```R
setwd("/users/etsibert/downloads/UCI HAR Dataset")
getwd()
```
Read and store the Activity Labels and Features of the data set
```R
ActivityLabels<-read.table("activity_labels.txt", stringsAsFactors = F)
names(ActivityLabels)<-c("activityId", "activity")
features<-read.table("features.txt", stringsAsFactors = F)
names(features)<-c("featureId","feature")
```
Read the training data files
```R
TrainSubjects<-read.table("train/subject_train.txt")
names(TrainSubjects)<-c("subjectId")
TrainLabels<-read.table("train/y_train.txt")
names(TrainLabels)<-c("labelId")
TrainVars<-read.table("train/X_train.txt")
names(TrainVars)<-features$feature
dsTrain<-data.frame(TrainSubjects, TrainLabels, TrainVars)
dsTrain$Source<-c("Train Set")
```
Read the test data files
```R
TestSubjects<-read.table("test/subject_test.txt")
names(TestSubjects)<-c("subjectId")
TestLabels<-read.table("test/y_test.txt")
names(TestLabels)<-c("labelId")
TestVars<-read.table("test/X_test.txt")
names(TestVars)<-features$feature
dsTest<-data.frame(TestSubjects, TestLabels, TestVars)
dsTest$Source<-c("Test Set")
```
Merge the traiing and test data frames into one
```R
data<-rbind(dsTrain, dsTest)
```
* Step 2: Extract only the measurements on the mean and standard deviation for each measurement
Extract only the features that represent a Mean or STD measurement, in addition to the labels ids and subject id columns
```R
columns_MEAN<-grep("*.mean*",names(data))
columns_STD<-grep("*.std*",names(data))
columnFilter<-c(columns_MEAN,columns_STD)
columnFilter<-sort(columnFilter)
filteredData<-data[,c(1,2,columnFilter)]
```
* Step 3: Uses descriptive activity names to name the activities in the data set
Add a new column in the Filtered data frame to contain the descriptive activity names (activityId lookup)
```R
filteredData$ActivityName<-ActivityLabels[ActivityLabels[filteredData$labelId,1],2]
```
* Step 4: Appropriately label the data set with descriptive variable names
Clean up the name of the variables (through a series of transforms) to make them more human readable
```R
cNames<-names(filteredData)
cNameTransform1<-function(x){gsub("Body","_Body",x)}
cNameTransform2<-function(x){gsub("Gravity","_Gravity",x)}
cNameTransform3<-function(x){gsub("mean","_Mean",x)}
cNameTransform4<-function(x){gsub("std","_STD",x)}
cNameTransform5<-function(x){gsub("^t","TimeDomain",x)}
cNameTransform6<-function(x){gsub("^f","FreqDomain",x)}
cNameTransform7<-function(x){gsub("\\.","",x)}
cNames<-sapply(cNames,cNameTransform1)
cNames<-sapply(cNames,cNameTransform2)
cNames<-sapply(cNames,cNameTransform3)
cNames<-sapply(cNames,cNameTransform4)
cNames<-sapply(cNames, cNameTransform5)
cNames<-sapply(cNames, cNameTransform6)
cNames<-sapply(cNames, cNameTransform7)
cNames<-tolower(cNames)
names(cNames)<-NULL
names(filteredData)<-cNames
```
Sample variable names are:
```R
> cNames
 [1] "subjectid"                                "labelid"                                  "timedomain_bodyacc_meanx"                 "timedomain_bodyacc_meany"                
 [5] "timedomain_bodyacc_meanz"                 "timedomain_bodyacc_stdx"                  "timedomain_bodyacc_stdy"                  "timedomain_bodyacc_stdz"                 
 [9] "timedomain_gravityacc_meanx"              "timedomain_gravityacc_meany"              "timedomain_gravityacc_meanz"              "timedomain_gravityacc_stdx"              
[13] "timedomain_gravityacc_stdy"               "timedomain_gravityacc_stdz"               "timedomain_bodyaccjerk_meanx"             "timedomain_bodyaccjerk_meany"            
[17] "timedomain_bodyaccjerk_meanz"             "timedomain_bodyaccjerk_stdx"              "timedomain_bodyaccjerk_stdy"              "timedomain_bodyaccjerk_stdz"             
[21] "timedomain_bodygyro_meanx"                "timedomain_bodygyro_meany"                "timedomain_bodygyro_meanz"                "timedomain_bodygyro_stdx"                
[25] "timedomain_bodygyro_stdy"                 "timedomain_bodygyro_stdz"                 "timedomain_bodygyrojerk_meanx"            "timedomain_bodygyrojerk_meany"           
[29] "timedomain_bodygyrojerk_meanz"            "timedomain_bodygyrojerk_stdx"             "timedomain_bodygyrojerk_stdy"             "timedomain_bodygyrojerk_stdz"            
[33] "timedomain_bodyaccmag_mean"               "timedomain_bodyaccmag_std"                "timedomain_gravityaccmag_mean"            "timedomain_gravityaccmag_std"            
[37] "timedomain_bodyaccjerkmag_mean"           "timedomain_bodyaccjerkmag_std"            "timedomain_bodygyromag_mean"              "timedomain_bodygyromag_std"              
[41] "timedomain_bodygyrojerkmag_mean"          "timedomain_bodygyrojerkmag_std"           "freqdomain_bodyacc_meanx"                 "freqdomain_bodyacc_meany"                
[45] "freqdomain_bodyacc_meanz"                 "freqdomain_bodyacc_stdx"                  "freqdomain_bodyacc_stdy"                  "freqdomain_bodyacc_stdz"                 
[49] "freqdomain_bodyacc_meanfreqx"             "freqdomain_bodyacc_meanfreqy"             "freqdomain_bodyacc_meanfreqz"             "freqdomain_bodyaccjerk_meanx"            
[53] "freqdomain_bodyaccjerk_meany"             "freqdomain_bodyaccjerk_meanz"             "freqdomain_bodyaccjerk_stdx"              "freqdomain_bodyaccjerk_stdy"             
[57] "freqdomain_bodyaccjerk_stdz"              "freqdomain_bodyaccjerk_meanfreqx"         "freqdomain_bodyaccjerk_meanfreqy"         "freqdomain_bodyaccjerk_meanfreqz"        
[61] "freqdomain_bodygyro_meanx"                "freqdomain_bodygyro_meany"                "freqdomain_bodygyro_meanz"                "freqdomain_bodygyro_stdx"                
[65] "freqdomain_bodygyro_stdy"                 "freqdomain_bodygyro_stdz"                 "freqdomain_bodygyro_meanfreqx"            "freqdomain_bodygyro_meanfreqy"           
[69] "freqdomain_bodygyro_meanfreqz"            "freqdomain_bodyaccmag_mean"               "freqdomain_bodyaccmag_std"                "freqdomain_bodyaccmag_meanfreq"          
[73] "freqdomain_body_bodyaccjerkmag_mean"      "freqdomain_body_bodyaccjerkmag_std"       "freqdomain_body_bodyaccjerkmag_meanfreq"  "freqdomain_body_bodygyromag_mean"        
[77] "freqdomain_body_bodygyromag_std"          "freqdomain_body_bodygyromag_meanfreq"     "freqdomain_body_bodygyrojerkmag_mean"     "freqdomain_body_bodygyrojerkmag_std"     
[81] "freqdomain_body_bodygyrojerkmag_meanfreq" "activityname"
```

* Step 5: Create an new, tidy data set with the average of each variable for each activity and each subject
Create the Tidy data frame averaging each numeric column while grouping by Activity name and Subject Id.
```R
n<-ncol(filteredData)
s<-filteredData[,c(1,3:n)]
library(dplyr)
tidy<-s %>% group_by(activityname,subjectid) %>% summarize_each(funs(mean))
cNamesMes<-names(tidy)[3:length(names(tidy))]
cNamesMes<-paste("AVGOf",cNamesMes)
names(tidy)<-c(names(tidy)[1:2],cNamesMes)
View(tidy)
```
Export the Tidy data frame for submission
```R
write.table(tidy,"tidy.txt", row.names = F)
```

