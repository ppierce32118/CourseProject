setwd("C:/Projects/Docs/Analytics/Class 3 Getting and Cleaning Data/CourseProject")

library("reshape2")

unzip(zipfile="./getdata-projectfiles-UCI HAR Dataset.zip")


trainXTrain <- read.table(file="./UCI HAR Dataset/train/X_train.txt", header = FALSE)
testXTest  <- read.table(file="./UCI HAR Dataset/test/X_test.txt", header = FALSE)
trainYTrain <- read.table(file="./UCI HAR Dataset/train/y_train.txt", header = FALSE)
testYTest  <- read.table(file="./UCI HAR Dataset/test/y_test.txt", header = FALSE)
trainSubjectTrain <- read.table(file="./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
testSubjectTest  <- read.table(file="./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
features <- read.table(file="./UCI HAR Dataset/features.txt", header = FALSE)
activityLabels <- read.table(file="./UCI HAR Dataset/activity_labels.txt", header = FALSE)

names(trainXTrain) <- features[,2]
names(testXTest) <- features[,2]
names(trainYTrain) <- "ActivityLabel"
names(testYTest) <- "ActivityLabel"
names(trainSubjectTrain) <- "SubjectID"
names(testSubjectTest) <- "SubjectID"
names(activityLabels) <- c("ActivityLabel", "ActivityName")

x <- rbind(trainXTrain, testXTest)
y <- rbind(trainYTrain, testYTest)
Subject <- rbind(trainSubjectTrain, testSubjectTest)

combineddata <- cbind(x, y, Subject)

selectColumns <- grep("mean|std|Activity|Subject", names(combineddata))
combineddata <- combineddata[,selectColumns]


combineddata <- merge(x = combineddata, 
              y = activityLabels, 
              by.x = "ActivityLabel", 
              by.y = "ActivityLabel")

names(combineddata) <- gsub(pattern="[()]", replacement="", names(combineddata))

names(combineddata) <- gsub(pattern="[-]", replacement="_", names(combineddata))

combineddata <- combineddata[,!(names(combineddata) %in% c("ActivityLabel"))]

meltdataset <- melt(data=combineddata, id=c("SubjectID", "ActivityName"))

tidyData <- dcast(data=meltdataset, SubjectID + ActivityName ~ variable, mean)

write.csv(tidyData, file="./TidyDataSet.txt", row.names=FALSE)




