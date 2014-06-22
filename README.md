Run
===
1  Read and MERGE       
        Read the two data sets
	Merge the data sets (train and test)
	
2 ADD NAMES to the values of the data sets & Assign descriptive activity names to name the activities in the data set

	Read features and activities, this will be added as headers of the columns
	Transformations to remove underscore and to use lower case characters in activities
	Assign descriptive activity names to name the activities in the data set
	By Replacing numbers (from 1 to 6) with name of activities
3 Assign names to columns
	Combine data sets
	Read features and look for those who contain mean or std
	Create a data set with the values of S, Y and the new Z (containing only the required indices)
4 Produce new data set
  Melt data by Subject and Activity
  Work out the mean for each column
  Write a new text csv file
