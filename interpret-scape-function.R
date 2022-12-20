library(rvest)

# Define a function to extract the text from a webpage
extract_elements <- function(url) {
  # Read the webpage into an R object
  webpage <- read_html(url)
  
  # Select the elements with the desired class
  elements <- html_nodes(webpage, ".translations__translation")
  
  # Extract the text from the webpage
  text <- html_text(elements)
  
  # Generate a unique filename for the text file
  filename <- paste0(gsub("[^[:alnum:]]", "", url), ".txt")
  
  # Construct the path to the subfolder
  subfolder <- file.path("txt")
  
  # Combine the path and the filename
  filepath <- file.path(subfolder, filename)
  
  writeLines(text, filepath)
}

# Create a list of URLs to scrape
urls <- c("https://interpret.csis.org/translations/the-correct-understanding-of-major-theoretical-and-practical-problems-of-chinas-development/", "https://interpret.csis.org/translations/talk-given-at-the-party-history-learning-and-education-mobilization-meeting/", "https://interpret.csis.org/translations/major-issues-concerning-chinas-strategies-for-mid-to-long-term-economic-and-social-development/")

# Scrape the text from each URL
elements <- lapply(urls, extract_elements)