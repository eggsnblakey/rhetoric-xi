require(readtext)
require(quanteda)
library(quanteda.textplots)
library(rtweet)
library(ggplot2)
library(tidyverse)

auth <- rtweet_app()
tmls <- get_timelines(c("ChineseEmbinUS"), n = 1000)
tmls = data.frame(lapply(tmls, as.character), stringsAsFactors=FALSE)
write.csv(tmls, file = "tweeps/export/burpy.csv")

## Loading required package: readtext
# get the data directory from readtext

DATA_DIR <- system.file("tweeps/export", package = "readtext")

rt_xi <- readtext(paste0(DATA_DIR, "tweeps/export/*"), text_field = "full_text")

corpus_xi <- corpus(rt_xi)

dfm_xi <- corpus_subset(corpus_xi) %>%
  dfm(remove = stopwords('english'), remove_punct = TRUE) %>%
  dfm_trim(min_termfreq = 30, verbose = FALSE)

set.seed(100)
textplot_wordcloud(dfm_xi)
