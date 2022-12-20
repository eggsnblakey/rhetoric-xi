library(rtweet)
library(dplyr)
library(readr)

screen_names <- c("SpokespersonCHN", "zlj517", "HuXijin_GT", "MFA_China", "zhang_heqing", "ReginaIplau", "globaltimesnews")

auth <- rtweet_app()

folder_path <- file.path("tweeps/accts")

# Retrieve the timelines of the accounts
for (screen_name in screen_names) {
  # Retrieve the timeline of the current account
  timeline <- get_timeline(screen_name, n = 100, include_rts = FALSE)
  
  user_timeline <- cbind(timeline, users_data(timeline)[, c("screen_name")])
  
  tweets_subset <- select(user_timeline, created_at, full_text, retweet_count, favorite_count, screen_name)
  
  # Construct the file path
  
  filepath <- file.path(folder_path, paste0(screen_name, ".csv"))
  
  # Export the data frame as a CSV file
  
  write_csv(tweets_subset, filepath)  
}
