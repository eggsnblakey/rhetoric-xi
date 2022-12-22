library(tidyverse)
library(rvest)

# Read in the URL list from a CSV file
url_list <- read.csv("fara/china-blank2.csv")

# Loop through each URL and download the PDF
for (i in 1:nrow(url_list)) {
  url <- url_list[i, "url"]
  filename <- url_list[i, "filename"]
  
  # Specify the path to the subfolder where you want to save the files
  filepath <- paste0("fara/registrations/pdfs/", filename)
  
  download.file(url, destfile = filepath, mode = "wb")
  
  # Take a 10 second break every 5 requests
  if (i %% 5 == 0) {
    Sys.sleep(10)
  }
}

