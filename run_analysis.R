# Set working directory
working_directory="C:/Users/Yamuni/Desktop/Data science specialisation/Getting and Cleaning Data/Course Project"
setwd(working_directory)

###Step 1: Merge the training and test sets to create one data set

##Step1A:Read text files

subject_test = read.csv("./UCI HAR Dataset/test/subject_test.txt", sep="",header=FALSE)
head(subject_test)
X_test = read.csv("./UCI HAR Dataset/test/X_test.txt", sep="",header=FALSE)
head(X_test)
y_test = read.csv("./UCI HAR Dataset/test/y_test.txt", sep="",header=FALSE)
head(y_test)
subject_train = read.csv("./UCI HAR Dataset/train/subject_train.txt", sep="",header=FALSE)
head(subject_train)
X_train = read.csv("./UCI HAR Dataset/train/X_train.txt", sep="",header=FALSE)
head(X_train)
y_train = read.csv("./UCI HAR Dataset/train/y_train.txt", sep="",header=FALSE)
head(y_train)
features=read.csv("./UCI HAR Dataset/features.txt", sep="",header=FALSE)
head(features)
activity_labels=read.csv("./UCI HAR Dataset/activity_labels.txt", sep="",header=FALSE)
head(activity_labels)

features=read.csv("./UCI HAR Dataset/features.txt", sep="",header=FALSE)
head(features)

#Step 1B: Make the feature names better suited for R with some substitutions
features[,2] = gsub('-mean', 'Mean', features[,2])
features[,2] = gsub('-std', 'Std', features[,2])
features[,2] = gsub('[-()]', '', features[,2])

#Step 1B: Make the feature names better suited for R with some substitutions
#features[,2] = gsub('-mean', 'Mean', features[,2])
#features[,2] = gsub('-std', 'Std', features[,2])
#features[,2] = gsub('[-()]', '', features[,2])

#Step 1C: Merge train and test data 
test<-cbind(X_test,subject_test,y_test)
head(test)
train<-cbind(X_train,subject_train,y_train)
head(train,n=3)

#subject<-rbind(subject_train,subject_test)
#activity<-rbind(y_train,y_test)

Data = rbind(train,test)
head(Data,n=3)

# Get only the data on mean and std. dev.
Mean_Std_Data <- grep(".*Mean.*|.*Std.*", features[,2])
head(Mean_Std_Data)

# Reduce the features table to what we want
features_new <- features[Mean_Std_Data,]
head(features_new)

#Add the last two columns (subject and activity)
Mean_Std_Data <- c(Mean_Std_Data, 562, 563)
head(Mean_Std_Data)
# Remove the unwanted columns from Data
NewData <- Data[,Mean_Std_Data]
head(NewData)

##Add the column names of features to NewData
colnames(NewData) <- c(features_new[, 2], "Activity", "Subject")
colnames(NewData)<- tolower(colnames(NewData))

library(reshape)
tidy_Data <- melt(NewData, id =c("activity","subject"))
head(tidy_Data)

#Step 5: Create the tidy data with measurements with respect to each subject and activities
tidy <- cast(tidy_Data, subject + activity ~ variable, mean)
dim(tidy)  # See the row and column number
summary(tidy)
head(tidy)
tail(tidy)
write.table(tidy, "tidy.txt", row.name=FALSE, sep="\t")



