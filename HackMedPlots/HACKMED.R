library(tidyverse)
#Generating example data
date_list <-
  seq(as.Date("2020-01-01"), as.Date("2020-01-20"), by = "days")
achievement <- sample(1:5, replace = TRUE, size = 20)
feelings <- sample(1:5, replace = TRUE, size = 20)
trigger_names <-
  c(
    "Coffee",
    "Distracted by YouTube",
    "Social Media notifications",
    "Stressed?",
    "Weather",
    "Loud Noises"
  )
trigger_numbers <- 1:length(trigger_names)
random_triggerday <- function(a = trigger_numbers) {
  sample(a, sample(1:length(a), 1, replace = TRUE))
}
triggers_example <- replicate(20, random_triggerday())

#Generating plots
plot(x = date_list, y = achievement, type = "l")
plot(x = date_list, y = feelings, type = "l")
plot(x = date_list, y = triggers_example, type = "p")

#fill NAs and convert to df
df <-
  data.frame(lapply(triggers_example, `length<-`, max(lengths(triggers_example))))
df <- data.frame(t(df))
df <- pivot_longer(df, cols = c("X1", "X2", "X3", "X4", "X5", "X6"))
date_df <- data.frame(date_list)
date_df_long <- date_df %>% slice(rep(1:n(), each = 6))
final_df <- cbind(date_df_long, df) %>%
  select(date_list, value)

#Generating the plot for the effect lists
ggplot(final_df, aes(x = date_list, y = value)) +
  geom_point() +
  xlab("Dates") +
  scale_y_continuous(name = "Effects",
                     breaks = 1:6,
                     labels = trigger_names)