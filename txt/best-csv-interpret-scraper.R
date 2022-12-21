library(rvest)
library(readr)
library(dplyr)

testy_xi <- read_html("https://interpret.csis.org/translations/?_paged=9")

links <- html_nodes(testy_xi, "a")

hrefs <- html_attr(links, "href")

selected <- grep("https://interpret.csis.org/translations/", hrefs, value = TRUE)

# Define a function to extract the text from a webpage

selected <- grep("https://interpret.csis.org/translations/", hrefs, value = TRUE)

# Define a function to extract the text from a webpage

extract_elements <- function(url) {
  # Read the webpage into an R object
  webpage <- read_html(url)
  
  node1 <- html_nodes(webpage, ".entry-header__title")
  node2 <- html_nodes(webpage, ".post-meta__date")
  node3 <- html_nodes(webpage, ".translations__translation")
  node4 <- html_nodes(webpage, ".post-meta__name")
  
  title <- html_text(node1)
  date_pub <- html_text(node2)
  date_pub <- gsub("Published ", "", date_pub)
  full_text <- html_text(node3)
  author <- unlist(lapply(node4, html_text))
  author <- paste(author, collapse = ", ")
  author <- iconv(author, "latin1", "ASCII", sub="")
  
  df <- data.frame(title, author, date_pub, full_text)
  
  # Generate a unique filename for the text file
  
  filename <- title[1]
  filename <- gsub("[^[:alnum:]]", "_", filename)
  filename <- substr(filename, 1, 50)
  
  # Construct the path to the subfolder
  subfolder <- file.path("txt/interpret")
  
  # Combine the path and the filename
  filepath <- file.path(subfolder, paste0(filename, ".csv"))
  
  write_csv(df, filepath)
}

# Scrape the text from each URL
elements <- lapply(selected, extract_elements)
