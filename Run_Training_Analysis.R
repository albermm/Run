## TASK 1 - MERGE        
        ## Read the two data sets
               sbjtst <- read.table("./test/subject_test.txt")
               sbjtrain <- read.table("./train/subject_train.txt")
               
               xtst <- read.table("./test/X_test.txt")
               xtrain <- read.table("./train/X_train.txt")
               
               ytst <- read.table("./test/y_test.txt")
               ytrain <- read.table("./train/y_train.txt")
           
        ## Merge the data sets (train and test)
               
                S <- rbind(sbjtst, sbjtrain) 
                X <- rbind(xtst, xtrain)
                Y <- rbind(ytst, ytrain) 
        
        ## The final data set will be done at the end of next part of the script, once the names are assigned --> See Code Line 44
 
   
        

##TASKs 3 & 4 - Add names to the values of the data sets & Assign descriptive activity names to name the activities in the data set

        ## Preparation 1.- Read features and activities, this will be added as headers of the columns
        features <- read.table("features.txt")
        activities <- read.table("activity_labels.txt")
        ## Preparation 2.- Transformations to remove underscore and to use lower case characters in activities
        activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
        

        ## 3.- Assign descriptive activity names to name the activities in the data set
        ## By Replacing numbers (from 1 to 6) with name of activities
        Y[,1] = activities[Y[,1], 2]

        ## 4.- Assign names to columns:
        names(S) <- "subject"        
        names(X) <- features$V2
        names(Y) <- "Activity"
    

## End of TASK 1 - Combine data sets
        total <- cbind(S, Y, X)


##TASK 2
        ##Read features and look for those who contain mean or std
        features <- read.table("features.txt")
        ReqIndices <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
        ##Load to Z, those columns of X that correspond to the values we just have found
        Z <- X[, ReqIndices]
        names(Z) <- features[ReqIndices, 2]
        names(Z) <- gsub("\\(|\\)", "", names(Z))
        names(Z) <- tolower(names(Z)) 
        ##Create a data set with the values of S, Y and the new Z (containing only the required indices)
        selection <- cbind(S, Y, Z)  

##TASK 5
       library(reshape2)               
       meltdata <- melt(selection, id = c("subject", "Activity"))
       newdata <- dcast(meltdata, subject + Activity ~ variable, mean)       
       write.csv(newdata, file='./Run_Analysisresult.txt', row.names=FALSE)
