#Coursera Get and Clean Data Course - Week 4 Project
#Eric Tsibertzopoulos; etsibert@hotmail.com
#January 2015
# Script Name: run_analysis.R
#---------------------------------------------------------------
setwd("/users/etsibert/downloads/UCI HAR Dataset")
getwd()
#TODO:
# 1. Merges the training and the test sets to create one data set.
ActivityLabels<-read.table("activity_labels.txt", stringsAsFactors = F)
names(ActivityLabels)<-c("activityId", "activity")
features<-read.table("features.txt", stringsAsFactors = F)
names(features)<-c("featureId","feature")

#Training Data Set
TrainSubjects<-read.table("train/subject_train.txt")
names(TrainSubjects)<-c("subjectId")
TrainLabels<-read.table("train/y_train.txt")
names(TrainLabels)<-c("labelId")
TrainVars<-read.table("train/X_train.txt")
names(TrainVars)<-features$feature
dsTrain<-data.frame(TrainSubjects, TrainLabels, TrainVars)
dsTrain$Source<-c("Train Set")
#Test Data Set
TestSubjects<-read.table("test/subject_test.txt")
names(TestSubjects)<-c("subjectId")
TestLabels<-read.table("test/y_test.txt")
names(TestLabels)<-c("labelId")
TestVars<-read.table("test/X_test.txt")
names(TestVars)<-features$feature
dsTest<-data.frame(TestSubjects, TestLabels, TestVars)
dsTest$Source<-c("Test Set")
#Merge the two data sets
data<-rbind(dsTrain, dsTest)
names(data)
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
columns_MEAN<-grep("*.mean*",names(data))
columns_STD<-grep("*.std*",names(data))
columnFilter<-c(columns_MEAN,columns_STD)
columnFilter<-sort(columnFilter)
filteredData<-data[,c(1,2,columnFilter)]
names(filteredData)
# 3. Uses descriptive activity names to name the activities in the data set
filteredData$ActivityName<-ActivityLabels[ActivityLabels[filteredData$labelId,1],2]
# 4. Appropriately labels the data set with descriptive variable names
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
cNames
names(filteredData)<-cNames

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
n<-ncol(filteredData)
s<-filteredData[,c(1,3:n)]
library(dplyr)
tidy<-s%>% group_by(activityname,subjectid) %>% summarize_each(funs(mean))
cNamesMes<-names(tidy)[3:length(names(tidy))]
cNamesMes<-paste("AVGOf",cNamesMes)
names(tidy)<-c(names(tidy)[1:2],cNamesMes)
View(tidy)
write.table(tidy,"tidy.txt", row.names = F)
#x<-read.table("tidy.txt")
##--------------------------------------------------------------------------------------------------------------------------------------------------