library(tidyverse)
library(rvest)

# Read in the URL list from a CSV file
url_list <- read.csv("fara/blank-fara.csv")

# Loop through each URL and download the PDF
for (i in 1:nrow(url_list)) {
  url <- url_list[i, "url"]
  filename <- url_list[i, "filename"]
  
  # Specify the path to the subfolder where you want to save the files
  filepath <- paste0("fara/registrations/pdfs/blanks/", filename)
  
  download.file(url, destfile = filepath, mode = "wb")
  
  # Take a 10 second break every 5 requests
  if (i %% 5 == 0) {
    Sys.sleep(10)
  }
}




# Install the 'curl' package if it is not already installed
install.packages("curl")

# Load the 'curl' package
library(curl)

# Read in the URL list from a CSV file
url_list <- read.csv("fara/china-only.csv")

# Loop through each URL and download the PDF
for (i in 1:nrow(url_list)) {
  url <- url_list[i, "url"]
  filename <- url_list[i, "filename"]
  
  # Specify the path to the subfolder where you want to save the files
  filepath <- paste0("fara/registrations/pdfs/china/", filename)
  
  # Use the 'curl_download' function from the 'curl' package to download the file
  # Set the 'progressfunction' argument to the 'curl_progressbar' function to display a progress bar
  curl_download(url, destfile = filepath, progressfunction = curl_progressbar)
  
  # Take a 10 second break every 5 requests
  if (i %% 5 == 0) {
    Sys.sleep(10)
  }
}