library(rvest)
library(readr)
library(dplyr)

testy_xi <- read_html("https://interpret.csis.org/translations/?_paged=1")

links <- html_nodes(testy_xi, "a")

hrefs <- html_attr(links, "href")

selected <- grep("https://interpret.csis.org/translations/", hrefs, value = TRUE)

# Define a function to extract the text from a webpage
extract_elements <- function(url) {
  # Read the webpage into an R object
  webpage <- read_html(url)
  
  # Select the elements with the desired class
  elements <- html_nodes(webpage, ".translations__translation")
  
  # Extract the text from the webpage
  text <- html_text(elements)
  
  # Generate a unique filename for the text file
  filename <- paste0(substr(gsub("[^[:alnum:]]", "", url), 35, 65), ".txt")
  
  # Construct the path to the subfolder
  subfolder <- file.path("txt/interpret")
  
  # Combine the path and the filename
  filepath <- file.path(subfolder, filename)
  
  writeLines(text, filepath)
}

# Scrape the text from each URL
elements <- lapply(selected, extract_elements)