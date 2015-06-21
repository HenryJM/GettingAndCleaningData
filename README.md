#Getting and Cleaning Data Course Project

run_analysis.R is a script that runs the complete analysis required.

First, it takes in the feature list and determines which features are to be collected. A few formatting tasks are run in order to follow R syntax better.

The corresponding features are read from both training and test sets. 

tidy_data_1 represents the desired (66) features out of all measurements made.

tidy_data_2 (our final product) is the aggregate mean of all these measurements over subject and activity done.