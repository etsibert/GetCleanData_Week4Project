# Coursera Get & Clean Data Week 4 Project
## Objective:
The purpose of this project is to demonstrate ability to collect, work with, and clean a data set. 
The goal is to prepare a tidy data set that can be used for later analysis.

##Submission: 
  * a tidy data set produced with the run_analysis.R script, 
  * a link to a Github repository containing the run_analysis.R script and supporting documentation, 
  * a code book that describes the variables, the data, and any transformations or work performed to clean up the data (CodeBook.md). You should also include a README.md
  * this Readme.md file
  
##Background information:
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced wearable computing algorithms to attract new users. 
The data used in this project represents data collected from the accelerometers of Samsung Galaxy S smartphones during a study.

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
Clean up the name of the variables to make them more human readable
```R
cNames<-names(filteredData)
TimeDomain<-function(x){gsub("^t","TimeDomain",x)}
FreqDomain<-function(x){gsub("^f","FreqDomain",x)}
RemoveDots<-function(x){gsub("\\.","",x)}
cNames<-sapply(cNames, TimeDomain)
cNames<-sapply(cNames, FreqDomain)
cNames<-sapply(cNames, RemoveDots)
cNames<-tolower(cNames)
names(cNames)<-NULL
names(filteredData)<-cNames
```
Sample variable names are:
```R
> cNames
 [1] "subjectid"                             "labelid"                               "timedomainbodyaccmeanx"                "timedomainbodyaccmeany"                "timedomainbodyaccmeanz"               
 [6] "timedomainbodyaccstdx"                 "timedomainbodyaccstdy"                 "timedomainbodyaccstdz"                 "timedomaingravityaccmeanx"             "timedomaingravityaccmeany"            
[11] "timedomaingravityaccmeanz"             "timedomaingravityaccstdx"              "timedomaingravityaccstdy"              "timedomaingravityaccstdz"              "timedomainbodyaccjerkmeanx"           
[16] "timedomainbodyaccjerkmeany"            "timedomainbodyaccjerkmeanz"            "timedomainbodyaccjerkstdx"             "timedomainbodyaccjerkstdy"             "timedomainbodyaccjerkstdz"            
[21] "timedomainbodygyromeanx"               "timedomainbodygyromeany"               "timedomainbodygyromeanz"               "timedomainbodygyrostdx"                "timedomainbodygyrostdy"               
[26] "timedomainbodygyrostdz"                "timedomainbodygyrojerkmeanx"           "timedomainbodygyrojerkmeany"           "timedomainbodygyrojerkmeanz"           "timedomainbodygyrojerkstdx"           
[31] "timedomainbodygyrojerkstdy"            "timedomainbodygyrojerkstdz"            "timedomainbodyaccmagmean"              "timedomainbodyaccmagstd"               "timedomaingravityaccmagmean"          
[36] "timedomaingravityaccmagstd"            "timedomainbodyaccjerkmagmean"          "timedomainbodyaccjerkmagstd"           "timedomainbodygyromagmean"             "timedomainbodygyromagstd"             
[41] "timedomainbodygyrojerkmagmean"         "timedomainbodygyrojerkmagstd"          "freqdomainbodyaccmeanx"                "freqdomainbodyaccmeany"                "freqdomainbodyaccmeanz"               
[46] "freqdomainbodyaccstdx"                 "freqdomainbodyaccstdy"                 "freqdomainbodyaccstdz"                 "freqdomainbodyaccmeanfreqx"            "freqdomainbodyaccmeanfreqy"           
[51] "freqdomainbodyaccmeanfreqz"            "freqdomainbodyaccjerkmeanx"            "freqdomainbodyaccjerkmeany"            "freqdomainbodyaccjerkmeanz"            "freqdomainbodyaccjerkstdx"            
[56] "freqdomainbodyaccjerkstdy"             "freqdomainbodyaccjerkstdz"             "freqdomainbodyaccjerkmeanfreqx"        "freqdomainbodyaccjerkmeanfreqy"        "freqdomainbodyaccjerkmeanfreqz"       
[61] "freqdomainbodygyromeanx"               "freqdomainbodygyromeany"               "freqdomainbodygyromeanz"               "freqdomainbodygyrostdx"                "freqdomainbodygyrostdy"               
[66] "freqdomainbodygyrostdz"                "freqdomainbodygyromeanfreqx"           "freqdomainbodygyromeanfreqy"           "freqdomainbodygyromeanfreqz"           "freqdomainbodyaccmagmean"             
[71] "freqdomainbodyaccmagstd"               "freqdomainbodyaccmagmeanfreq"          "freqdomainbodybodyaccjerkmagmean"      "freqdomainbodybodyaccjerkmagstd"       "freqdomainbodybodyaccjerkmagmeanfreq" 
[76] "freqdomainbodybodygyromagmean"         "freqdomainbodybodygyromagstd"          "freqdomainbodybodygyromagmeanfreq"     "freqdomainbodybodygyrojerkmagmean"     "freqdomainbodybodygyrojerkmagstd"     
[81] "freqdomainbodybodygyrojerkmagmeanfreq" "activityname" 
```

* Step 5: Create an new, tidy data set with the average of each variable for each activity and each subject
Create the Tidy data frame averaging each numeric column while grouping by Activity name and Subject Id.
```R
n<-ncol(filteredData)
s<-filteredData[,c(1,3:n)]
library(dplyr)
tidy<-s %>% group_by(activityname,subjectid) %>% summarize_each(funs(mean))
View(tidy)
```
Export the Tidy data frame for submission
```R
write.table(tidy,"tidy.txt", row.names = F)
```

  
  
