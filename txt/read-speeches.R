library(rvest)
library(readr)
library(dplyr)
library(quanteda)
library(readtext)

testy_xi <- read_html("https://www.fmprc.gov.cn/mfa_eng/wjdt_665385/zyjh_665391/index_1.html")

base_url <- "https://www.fmprc.gov.cn/mfa_eng/wjdt_665385/zyjh_665391/"

links <- html_nodes(testy_xi, "a")

hrefs <- html_attr(links, "href")

selected <- grep(".*\\.html$", hrefs, value = TRUE)
selected <- gsub("./", base_url, selected, fixed = TRUE)

print(selected)

write.csv(selected, "selected2.csv")

speech <- read_html("https://www.fmprc.gov.cn/mfa_eng/wjdt_665385/zyjh_665391/202212/t20221225_10994828.html")
content <- html_nodes(speech, ".content")
title <- html_nodes(speech, ".title")

content <- html_text(content)
title <- html_text(title)
df <- data.frame(title, content)

print(text)


talkie <- readtext("output.txt")
corpus_talkie <- corpus(talkie)
doc.tokens <- tokens(corpus_talkie)
doc.tokens <- tokens(doc.tokens, remove_punct = TRUE, remove_numbers = TRUE, remove_symbols = TRUE)
doc.tokens <- tokens_select(doc.tokens, stopwords('english'),selection='remove')
doc.tokens <- tokens_tolower(doc.tokens)

# Read in the stopwords from a CSV file
extrawords <- read.csv("junk.csv", stringsAsFactors = FALSE)
extrawords <- unlist(extrawords)
doc.tokens <- tokens_remove(doc.tokens, pattern = extrawords, valuetype = 'fixed')

doc.dfm.xi <- dfm(doc.tokens)


junk <- topfeatures(doc.dfm.xi, 50)
write.csv(junk, "junk6.csv")
pizza <- kwic(doc.tokens, "multilateralism", window = 25)
write.csv(pizza, "pizza.csv")
