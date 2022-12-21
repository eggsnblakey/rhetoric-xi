library(rvest)
library(readr)
library(dplyr)

testy_xi <- read_html("https://interpret.csis.org/translations/?_translation_tags=xi-jinping-speech")

links <- html_nodes(testy_xi, "a")

hrefs <- html_attr(links, "href")

selected <- grep("https://interpret.csis.org/translations/", hrefs, value = TRUE)

# Define a function to create a filename from the last 15 characters of a URL
create_filename <- function(url) {
  # Extract the last 15 characters of the URL
  url <- substr(url, nchar(url) - 14, nchar(url))
  
  # Return the filename
  return(paste0(url, "txt/xi-speech/*.txt"))
}


# Define a function to extract the text from a webpage
extract_elements <- function(url) {
  # Read the webpage into an R object
  webpage <- read_html(url)
  
  # Select the elements with the desired class
  elements <- html_nodes(webpage, ".translations__translation")
  
  # Extract the text from the webpage
  text <- html_text(elements)
  
  # Generate a unique filename for the text file
  filename <- create_filename(url)
  
  # Construct the path to the subfolder
  subfolder <- file.path("txt/xi-speech")
  
  # Combine the path and the filename
  filepath <- file.path(subfolder, filename)
  
  writeLines(text, filepath)
}

# Scrape the text from each URL
elements <- lapply(selected, extract_elements)