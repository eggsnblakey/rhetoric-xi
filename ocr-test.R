library(tesseract)
library(pdftools)
library(tm)

setwd("fara/registrations")

files <- list.files(pattern = "pdf$")

print(files)

opinions <- lapply(files, pdf_text)

length(opinions)

lapply(opinions, length)

corp <- Corpus(URISource(files),
               readerControl = list(reader = readPDF))

opinions.tdm <- TermDocumentMatrix(corp, 
                                   control = 
                                     list(removePunctuation = TRUE,
                                          stopwords = TRUE,
                                          tolower = TRUE,
                                          stemming = TRUE,
                                          removeNumbers = TRUE,
                                          bounds = list(global = c(3, Inf)))) 