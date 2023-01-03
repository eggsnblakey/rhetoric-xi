library(rtweet)
library(dplyr)
library(readr)

username <- "zlj517"

min_likes <- 1000

tweets <- search_tweets("zlj517", n = Inf, retryonratelimit = TRUE,
                        favorite_count = min_likes, include_rts = FALSE)

write_csv(tweets, "viral.csv")