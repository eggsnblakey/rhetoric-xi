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
  
  page_title <- html_nodes(html, ".title")
  
  # Extract the text content of the element(s)
  page_text <- html_text(page_content)
  page_title_text <- html_text(page_title)
  
  df <- data.frame(page_title_text, page_text)
  
  # Append the extracted text to the content vector
  content <- c(content, df)
}

# Write the content vector to a text file
write.csv(content, "output.csv")

library(rvest)
library(readr)

df <- read_csv("selected2.csv")

# Initialize an empty data frame to store the extracted content
content <- data.frame(page_title_text = character(), page_text = character())

# Iterate through the rows of the data frame
for (i in 1:nrow(df)) {
  # Read in the HTML of the webpage
  html <- read_html(df$url[i])
  
  # Extract the content of the elements with the "content" class
  page_content <- tryCatch(html_node(html, ".content"), error = function(e) NA)
  
  page_title <- tryCatch(html_nodes(html, ".title"), error = function(e) NA)
  
  # Extract the text content of the element(s)
  page_text <- tryCatch(html_text(page_content), error = function(e) NA)
  page_title_text <- tryCatch(html_text(page_title), error = function(e) NA)
  
  # Append the extracted data to the content data frame
  new_row <- data.frame(page_title_text, page_text)
  content <- rbind(content, new_row)
}

# Write the content data frame to a CSV file
write.csv(content, "output.csv")


library(rvest)
library(readr)

df <- read_csv("selected2.csv")

# Initialize an empty data frame to store the extracted content
content <- data.frame(page_title_text = character(), page_text = character())

# Iterate through the rows of the data frame
for (i in 1:nrow(df)) {
  # Read in the HTML of the webpage
  html <- read_html(df$url[i])
  
  # Extract the content of the elements with the "content" class
  page_content <- tryCatch(html_node(html, ".content"), error = function(e) NA)
  
  page_title <- tryCatch(html_nodes(html, ".title"), error = function(e) NA)
  
  # Extract the text content of the element(s)
  page_text <- tryCatch(unlist(lapply(page_content, html_text)), error = function(e) NA)
  page_title_text <- tryCatch(unlist(lapply(page_title, html_text)), error = function(e) NA)
  
  # Check if the extracted data is not empty
  if (!is.null(page_title_text) && !is.null(page_text)) {
    # Append the extracted data to the content data frame
    new_row <- data.frame(page_title_text, page_text)
    content <- rbind(content, new_row)
  }
}

# Write the content data frame to a CSV file
write.csv(content, "output.csv")

