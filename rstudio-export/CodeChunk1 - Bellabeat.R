install.packages("tidyverse")
library(tidyverse)
library(readr)
library(dplyr)
daily_activity <- read_csv("dailyActivity_merged.csv")
colnames(daily_activity)
head(daily_activity)
daily_steps <- read_csv("dailySteps_merged.csv")
View(daily_steps)
View(daily_activity)
daily_intensities <- read_csv("dailyIntensities_merged.csv")
View(daily_intensities)
sleep_data <- read_csv("sleepDay_merged.csv")
View(sleep_data)
heartrate <- read_csv("heartrate_seconds_merged.csv")
View(heartrate)

##Creating new dataframe with info per id
daily_activity_by_id <- daily_activity %>% 
  group_by(Id) %>% 
  summarise( Avg_Steps = mean(TotalSteps), Avg_Distance  = mean(TotalDistance), Avg_VeryActive_Distance = mean(VeryActiveDistance), Avg_ModActive_Distance = mean(ModeratelyActiveDistance)
             ,Avg_LightActive_Distance = mean(LightActiveDistance), Avg_VeryActive_Min = mean(VeryActiveMinutes), Avg_FairlyActive_Min = mean(FairlyActiveMinutes), Avg_LightActive_Min = mean(LightlyActiveMinutes),
             Avg_Sedentary_Min = mean(SedentaryMinutes), Avg_Calories = mean(Calories)) %>% 
  drop_na() 
 
View(daily_activity_by_id)  
##Visualizing Data

ggplot(data = daily_activity_by_id)+ geom_point(mapping= aes(x=Avg_Distance, y= Avg_Calories, color = Avg_Distance))+
  geom_smooth(mapping= aes(x=Avg_Distance, y= Avg_Calories),color="green")

ggplot(data = daily_activity_by_id)+ geom_smooth(mapping= aes(x=Avg_Sedentary_Min, y= Avg_Calories), color= "purple")


                                                                                                           