require(readtext)
require(quanteda)
library(rtweet)
library(ggplot2)
library(tidyverse)
library(quanteda.textplots)


# This creates a temporary directory, pulls the last 100 tweets from ChineseEmbinUS, and exports them as a CSV.

dir.create("tweeps/export")
auth <- rtweet_app()
tmls <- get_timeline(c("ChineseEmbinUS"), n = 100)
tmls = data.frame(lapply(tmls, as.character), stringsAsFactors=FALSE)
write.csv(tmls, file = "tweeps/export/burpy.csv")

# This runs the readtext command against the "full_text" field of the exported tweets CSV to ingest them into R and deletes the temporary folder and CSV file

rt_xi <- readtext("tweeps/export/*", text_field = "full_text")
unlink("tweeps/export", recursive = TRUE)

# This converts the readtext output into a corpus so that it can be analyzed using various quantdata packages

corpus_xi <- corpus(rt_xi)

# Now that the corpus is created in R, it can be converted to tokens for various types of analysis.
# The following examples include different ways of creating tokens from the corpus, including by words, sentences, and characters.

doc.tokens <- tokens(corpus_xi)

# doc.tokens.sentence <- tokens(corpus_xi, what = "sentence")

# doc.tokens.character <- tokens(corpus_xi, what = "character")

# This command removes punctuation, numbers and symbols from the existing doc.tokens.

doc.tokens <- tokens(doc.tokens, remove_punct = TRUE, remove_numbers = TRUE, remove_symbols = TRUE)

#This command removes English stopwords.

doc.tokens <- tokens_select(doc.tokens, stopwords('english'),selection='remove')

# This command shortens words to their stems to compare similar terms (e.g. Chin* for "China" and "Chinese")

#doc.tokens <- tokens_wordstem(doc.tokens)

#Now that the inputs are tokenized, we can create a document feature matrix for various types of analysis

doc.dfm.xi <- dfm(doc.tokens)

# Create a wordcloud from the DFM

# textplot_wordcloud(doc.dfm.xi)

# View 15 most recurring words
topfeatures(doc.dfm.xi, 15)
