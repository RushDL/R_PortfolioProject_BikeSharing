# Install and load packages -------------------------------------------------------------------------------------------


install.packages("tidyverse")

library(tidyverse) # helps wrangle data
library(lubridate) # helps wrangle date attributes
library(ggplot2) # helps visualize data
library(janitor) #helps also wrangle data





# Collect data ---------------------------------------------------------------------------------------------------------



trip202112 <- read.csv("raw_data/202112-divvy-tripdata.csv")
trip202111 <- read.csv("raw_data/202111-divvy-tripdata.csv")
trip202110 <- read.csv("raw_data/202110-divvy-tripdata.csv")
trip202109 <- read.csv("raw_data/202109-divvy-tripdata.csv")
trip202108 <- read.csv("raw_data/202108-divvy-tripdata.csv")
trip202107 <- read.csv("raw_data/202107-divvy-tripdata.csv")
trip202106 <- read.csv("raw_data/202106-divvy-tripdata.csv")
trip202105 <- read.csv("raw_data/202105-divvy-tripdata.csv")
trip202104 <- read.csv("raw_data/202104-divvy-tripdata.csv")
trip202103 <- read.csv("raw_data/202103-divvy-tripdata.csv")
trip202102 <- read.csv("raw_data/202102-divvy-tripdata.csv")
trip202101 <- read.csv("raw_data/202101-divvy-tripdata.csv")




# Check if these dataframes are row-bindable. 
#   a. If these dataframes are readily row-bindable, then we bind it.
#   b. If not, then we standardize there column names and column types. 


compare_df_cols(trip202101, trip202102, trip202103, trip202104, trip202105, trip202106, trip202107, trip202108, 
                trip202109, trip202110, trip202111, trip202112)




compare_df_cols_same(trip202101, trip202102, trip202103, trip202104, trip202105, trip202106, trip202107, trip202108, 
                     trip202109, trip202110, trip202111, trip202112)




# Stack monthly's dataframes into one big dataframe. 


all_trip <- bind_rows(trip202101, trip202102, trip202103, trip202104, trip202105, trip202106, trip202107, trip202108, 
                      trip202109, trip202110, trip202111, trip202112)




# Examine columns


str(all_trip)




# Data Cleaning. ------------------------------------------------------------------------------------------------------



# To do: 
# 1. Verify if categorical values in rideable_type, and member_casual were consistent. 
# 2. Convert started_at and ended_at columns into datetime columns.   
# 3. Separate datetime columns in to two column.  





# 1. Verify if categorical values in rideable_type, and member_casual were consistent. 

table(all_trip$rideable_type)


table(all_trip$member_casual)




# 2. Convert started_at and ended_at columns into datetime columns.  


all_trip <- all_trip %>% 
  mutate(
    started_at = as.Date(started_at),
    ended_at = as.Date(ended_at)
    
  )







