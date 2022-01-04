## Calories burnt by distance
## Calories Burnt per user-type
cal_by_distance <- daily_activity%>%
  summarise(
    distance_type = factor(case_when(
      LightActiveDistance > mean(LightActiveDistance) & ModeratelyActiveDistance < mean(ModeratelyActiveDistance) & VeryActiveDistance < mean(VeryActiveDistance) ~ "Lightly Active Distance",
      LightActiveDistance < mean(LightActiveDistance) & ModeratelyActiveDistance > mean(ModeratelyActiveDistance) & VeryActiveDistance < mean(VeryActiveDistance) ~ "Moderately Active Distance",
      LightActiveDistance < mean(LightActiveDistance) & ModeratelyActiveDistance < mean(ModeratelyActiveDistance) & VeryActiveDistance > mean(VeryActiveDistance) ~ "Very Active Distance",
    ),levels=c("Lightly Active Distance", "Moderately Active Distance", "Very Active Distance")), Calories,TotalSteps,Id) %>%
  drop_na()

View(cal_by_distance)
ggplot(data = cal_by_distance) + geom_point(mapping = aes(x= distance_type, y= Calories, color = TotalSteps))+
  geom_boxplot(mapping = aes(x= distance_type, y= Calories))
