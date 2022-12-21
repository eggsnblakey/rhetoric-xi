#This script will pull the last 1500 tweets of the account name provided in the dialog.

library(rtweet)
library(dplyr)
library(readr)
library(svDialogs)
library(tcltk)

auth <- rtweet_app()

userid <- readline("Enter a screen name: ")

folder_path <- file.path("tweeps/accts")

timeline <- get_timeline(userid, n = 1500, include_rts = FALSE)

user_timeline <- cbind(timeline, users_data(timeline)[, c("screen_name")])

tweets_subset <- select(user_timeline, created_at, full_text, retweet_count, favorite_count, screen_name)

# Construct the file path

filepath <- file.path(folder_path, paste0(userid, ".csv"))

# Export the data frame as a CSV file

write_csv(tweets_subset, filepath)
