
# Project Name: "Household Consumption Regression Project"

rm(list = ls()) # clean up the workspace

######################################################################

# THESE ARE THE PROJECT PARAMETERS NEEDED TO GENERATE THE REPORT

# When running the case on a local computer, modify this in case you saved the case in a different directory 
# (e.g. local_directory <- "C:/user/MyDocuments" )
# type in the Console below help(getwd) and help(setwd) for more information
local_directory <- getwd()

# Clean up any left over tmp directories
clean1 <- unlink(paste(local_directory,"../TMPdirReport",sep="/"), recursive = TRUE )      
clean2 <- unlink(paste(local_directory,"../TMPdirSlides",sep="/"), recursive = TRUE )      
if (clean1 + clean2)
  setwd("../")
local_directory <- getwd()
cat("\n *********\n WORKING DIRECTORY IS ", local_directory, "\n PLEASE CHANGE IT IF IT IS NOT CORRECT using setwd(..) - type help(setwd) for more information \n *********")

# Please ENTER the name of the file with the data used. The file should contain a matrix with one row per observation (e.g. person) and one column per attribute. THE NAME OF THIS MATRIX NEEDS TO BE ProjectData (otherwise you will need to replace the name of the ProjectData variable below with whatever your variable name is, which you can see in your Workspace window after you load your file)

datafile_name <- "TR_Regression Data.csv" # this is the default name of the data for a project

# Please ENTER the dependent variable
dependent_variable <- "TotalConsumption"

# Please ENTER the independent variable
independent_variables <- c("MinimumWage", "PercentageOfUnderprivilaged",	"OverallHappiness")

# Please ENTER the all variables
all_variables <- c("Year", "MedianAge", "UrbanPopulation", "MinimumWage", "Inflation", "Unemployment", "PercentageOfUnderprivilaged",  "OverallHappiness", "GLA", "ShoppingMall", "IlleteracyRate")

# this loads the selected data
ProjectData <- read.csv(paste("data", datafile_name, sep = "/"), sep=";", dec=",") # this contains only the matrix ProjectData

################################################
# Now run everything

source(paste(local_directory,"R/library.R", sep="/"))
source(paste(local_directory,"R/heatmapOutput.R", sep = "/"))

# let's see the names of the variables so that we use those names
cat("\n\n\nOur variables are:",colnames(ProjectData),"\n\n") 

source(paste(local_directory,"R/runcode.R", sep = "/"))

if (start_local_webapp){
  # now run the app
  runApp(paste(local_directory,"tools", sep="/"))  
}
