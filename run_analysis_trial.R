library(dplyr)
library(tidyr)
setwd("/Users/michelle/Downloads/data/R in coursera/datascience/getting and cleaning data/final project/UCI HAR Dataset") #还需要根据GitHub的情况更改
## read the files
features<-read.table('features.txt'); names<-features[,2] ## use the features as names of columns.
x_train<-read.table('train/X_train.txt',col.names = names);y_train<-read.table('train/y_train.txt');subject_train<-read.table('train/subject_train.txt')
x_test<-read.table('test/X_test.txt',col.names = names);y_test<-read.table('test/y_test.txt');subject_test<-read.table('test/subject_test.txt')

## merge train and test datasets
train<-cbind(cbind(x_train,y_train),subject_train) 
test<-cbind(cbind(x_test,y_test),subject_test)
total<-rbind(test,train)
names(total)[-1:-561]<-c('Sport_Type','Subject_Volunteer')

## extract the columns containing 'mean' or 'std'.
total_m_s<-cbind(total[,grep('mean|std',features[,2])],total[-(1:561)])

## change the labels for different activities.
total_m_s$Sport_type<-factor(as.vector(total_m_s$Sport_type),levels = c(1:6),labels = activity_lables[,2])


## Tidy dataset with the average of each variable for each activity and each subject.

# 1) extract the variables with 'X|Y|Z' in their names,and put different variables in different datasets.
total_m<-total_m_s[,grep('mean',names(total_m_s))]
total_reshape_candidate<-total_m[,grep('(X|Y|Z)$',names(total_m))]
name_list<-strsplit(names(total_reshape_candidate),split = '[.]')
n<-dim(total_reshape_candidate)[2]
id_df<-cbind(select(total_m_s,Sport_type,Subject_Volunteer),id = 1:dim(total)[1])
new_name<-c()
dataset_list<-list()
for (i in seq(1,n,by = 3)) {
    new_name<-c(new_name,paste(name_list[[i]][1],name_list[[i]][2],sep ='_' ))
    dataset_list[[((i-1)/3)+1]]<-cbind(total_reshape_candidate[,i:(i+2)],id_df)
}
names(dataset_list)<-new_name

# 2) use gather() to change the shape of the datasets
for (i in 1:length(dataset_list)) {
    dataset_list[[i]]<-gather(dataset_list[[i]],key = axial,value,-(4:6))
    dataset_list[[i]]$axial<-factor(dataset_list[[i]]$axial,labels = c('X','Y','Z'))
}

# 3) use cbind() to merge and remove the repeated variables.
tidy_dataset<-dataset_list[[1]][,1:4]
for (i in 1:length(dataset_list)) {
    tidy_dataset<-cbind(tidy_dataset,dataset_list[[i]][,5])
    names(tidy_dataset)[(4+i)]<-names(dataset_list)[i]
}
