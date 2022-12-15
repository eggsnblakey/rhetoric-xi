require(readtext)
require(quanteda)
library(quanteda.textplots)

## Loading required package: readtext
# get the data directory from readtext

DATA_DIR <- system.file("txt/", package = "readtext")

rt_xi <- readtext(paste0(DATA_DIR, "txt/*"), text_field = "texts")

corpus_xi <- corpus(rt_xi)

dfm_xi <- corpus_subset(corpus_xi) %>%
  dfm(remove = stopwords('english'), remove_punct = TRUE) %>%
  dfm_trim(min_termfreq = 20, verbose = FALSE)

set.seed(100)
textplot_wordcloud(dfm_xi)