library(rvest)
library(readr)

df <- read_csv("selected2.csv")

# Initialize an empty character vector to store the extracted content
content <- character()

# Iterate through the rows of the data frame
for (i in 1:nrow(df)) {
  # Read in the HTML of the webpage
  html <- read_html(df$url[i])
  
  # Extract the content of the elements with the "content" class
  page_content <- html_node(html, ".content")
  
  # Extract the text content of the element(s)
  page_text <- html_text(page_content)
  
  # Append the extracted text to the content vector
  content <- c(content, page_text)
}

# Write the content vector to a text file
write_lines(content, "output.txt")