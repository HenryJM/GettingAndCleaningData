#Getting and Cleaning Data Course Project

run_analysis.R is a script that runs the complete analysis required. Its output is in Coursera.

First, it takes in the feature list and determines which features are to be collected. A few cosmetic formatting tasks are run in order to follow R syntax better.

The corresponding features are then read from both training and test sets. Columns for subject and activity are added at this stage. The sets are then combined after marking them "training" and "test" accordingly.

tidy_data_1 represents the desired (66) features out of all measurements made.

tidy_data_2 (our final product) is the aggregate mean of all these measurements over subject and activity done.

Both data sets have columns for Subject Number, Activity Done. tidy_data_1 has distinctions for Train/Test runs, while tidy_data_2 does not (as aggregate data). Every column corresponds to a unique variable being measured and vice versa. Each row is one observation.