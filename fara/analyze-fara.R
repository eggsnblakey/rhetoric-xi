library(tidyverse)
library(rvest)

# Read in the URL list from a CSV file
url_list <- read.csv("url_list2.csv")

# Loop through each URL and download the PDF
for (i in 1:nrow(url_list)) {
  url <- url_list[i, "url"]
  filename <- url_list[i, "filename"]
  download.file(url, destfile = filename, mode = "wb")
}

