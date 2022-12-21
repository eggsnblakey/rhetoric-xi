library(rvest)
library(xml2)

webpage <- read_html("https://interpret.csis.org/translations/the-correct-understanding-of-major-theoretical-and-practical-problems-of-chinas-development/")

elements <- html_nodes(webpage, ".translations__translation")

text <- html_text(elements)

write(text, file = "txt/correct-und.txt")
