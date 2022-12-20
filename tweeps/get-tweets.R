library(rtweet)
library(dplyr)
library(readr)

# Read the CSV file containing the screen names
screen_names <- read.csv("tweeps/acct-list.csv")

auth <- rtweet_app()

# Retrieve the timelines of the accounts
tweets <- get_timeline(c(SpokespersonCHN, zlj517) n = 100, include_rts = FALSE)

# Filter the timelines to categories we care about
tweets_subset <- select(tmls, created_at, full_text, retweet_count, favorite_count)

# Write the timelines to CSV
write_csv(tweets_subset, "tweeps/tweets.csv")
