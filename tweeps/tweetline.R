library(ggplot2)
library(tidyverse)
library(dplyr)
library(tidytext)

tweets <- read.csv("tweeps/accts/517.csv")


word_counts <- tweets %>%
  select(full_text) %>%
  unnest_tokens(word, full_text) %>%
  count(word)

stopwords <-stop_words$word

filtered_word_counts <- word_counts %>%
  anti_join(stop_words)

ggplot(data = filtered_word_counts, aes(x = word, y = n)) +
  geom_col()
