library(dplyr)
library(data.table)
fileurl<-'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
if(!file.exists('UCI HAR Dataset')){
    download.file(fileurl,destfile = 'UCI HAR Dataset',method = 'curl')
}
setwd("UCI HAR Dataset") #还需要根据GitHub的情况更改
## read the files
features<-read.table('features.txt'); names<-features[,2] ## use the features as names of columns.
x_train<-read.table('train/X_train.txt',col.names = names);y_train<-read.table('train/y_train.txt');subject_train<-read.table('train/subject_train.txt')
x_test<-read.table('test/X_test.txt',col.names = names);y_test<-read.table('test/y_test.txt');subject_test<-read.table('test/subject_test.txt')

## merge train and test datasets,and correct the names of the variables
train<-cbind(cbind(x_train,y_train),subject_train) 
test<-cbind(cbind(x_test,y_test),subject_test)
total<-rbind(test,train)
names(total)[-1:-561]<-c('Sport_Type','Subject_Volunteer')

## extract the columns containing 'mean' or 'std'.
total_m_s<-cbind(total[-(1:561)],total[,grep('mean|std',features[,2])])
## change the labels for different activities.
total_m_s$Sport_type<-factor(as.vector(total_m_s$Sport_type),levels = c(1:6),labels = activity_lables[,2])


## Tidy dataset with the average of each variable for each activity and each subject.
total.melt<-melt(total_m_s,id = c('Sport_Type','Subject_Volunteer'))
average_total<-dcast(total.melt,Sport_Type+Subject_Volunteer~variable,mean)