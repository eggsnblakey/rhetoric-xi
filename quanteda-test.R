#This is only a test!!

require(readtext)
require(quanteda)
library(quanteda.textplots)
library(ggplot2)
library(tidyverse)
library(readtext)

## Loading required package: readtext
# get the data directory from readtext

xi_speeches <- readtext("txt/xi-speech/*.txt")

corpus_xi <- corpus(xi_speeches)

dfm_xi <- corpus_subset(corpus_xi) %>%
  dfm(remove = stopwords('english'), remove_punct = TRUE) %>%
  dfm_trim(min_termfreq = 30, verbose = FALSE)

set.seed(100)
textplot_wordcloud(dfm_xi)