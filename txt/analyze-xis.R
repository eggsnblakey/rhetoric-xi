library(quanteda)
library(quanteda.dictionaries)
library(readtext)

dataframe <- readtext("txt/xi-speech/*.csv", text_field = "full_text")

doc.corpus <- corpus(dataframe)

doc.tokens <- tokens(doc.corpus)
doc.tokens <- tokens(doc.tokens, remove_punct = TRUE, 
                     remove_numbers = TRUE)
doc.tokens <- tokens_select(doc.tokens, stopwords('english'),selection='remove')
doc.tokens <- tokens_tolower(doc.tokens)

doc.dfm.final <- dfm(doc.tokens)

topfeatures(doc.dfm.final, 25)

containment <- head(kwic(doc.tokens, "contain"))

output_lsd <- liwcalike(doc.tokens, dictionary = data_dictionary_LaverGarry)
head(output_lsd)

as.phrase(tokens("United States"))

containment <- kwic(doc.tokens, pattern = "democr*", valuetype = "regex", window = 15)
write_csv(containment, "democ.csv")
