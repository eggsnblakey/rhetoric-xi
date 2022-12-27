# This first script will list the pdfs that contain the word "China"
library(pdftools)

files <- list.files(pattern = "*.pdf")



# Create an empty vector to store the names of the PDF files that contain the word
results <- c()

# Loop through the PDF files
for (file in files) {
  # Read the PDF file
  pdf_text <- pdf_text(file)
  
  # Search for the word "hello" in the character vector
  if (any(grepl("China", pdf_text))) {
    # If the word is found, add the file to the results vector
    results <- c(results, file)
  }
}

# Load the necessary libraries
library(tidyverse)

setwd("C:/Users/jakeh/Documents/Coding/rhetoric-xi/fara/registrations/pdfs/blanks")

# Read in the CSV file
results <- read_csv("results.csv")

# Loop through each file in the list
for (i in 1:nrow(results)) {
  
  # Get the file name from the list
  file_name <- results$file_names[i]
  
  # Concatenate the strings using the paste() function
  to <- paste0("china-hit/", file_name)
  
  # Use the file.rename() function to move the file
  file.rename(from = file_name, to = to)
}








# Load the 'pdftools' and 'magrittr' packages
library(pdftools)
library(magrittr)

# Set the path to the folder containing the PDFs
pdf_folder <- "fara/registrations/pdfs"

# Set the path to the folder where you want to save the PDFs without text
no_text_pdf_folder <- "fara/registrations/pdfs/notext"

# Scan the PDF folder and extract a list of PDF filenames
pdf_filenames <- list.files(pdf_folder, full.names = TRUE, pattern = "\\.pdf$")

# Iterate over the PDF filenames and move PDFs without text to the no text PDF folder
for (pdf_filename in pdf_filenames) {
  # Extract the text from the PDF using the 'pdf_text' function from the 'pdftools' package
  pdf_text <- pdf_text(pdf_filename)
  
  # Check if the PDF contains any text by checking if the length of the text is greater than zero
  if (length(pdf_text) == 0) {
    # Move the PDF without text to the no text PDF folder
    file.rename(pdf_filename, file.path(no_text_pdf_folder, basename(pdf_filename)))
  }
}

# Install the 'pdftools' and 'magrittr' packages if they are not already installed
install.packages(c("pdftools", "magrittr"))

# Load the 'pdftools' and 'magrittr' packages
library(pdftools)
library(magrittr)

# Set the path to the folder containing the PDFs
pdf_folder <- "path/to/pdf/folder"

# Set the path to the folder where you want to save the PDFs containing the string "China"
china_pdf_folder <- "path/to/china/pdf/folder"

# Scan the PDF folder and extract a list of PDF filenames
pdf_filenames <- list.files(pdf_folder, full.names = TRUE, pattern = "\\.pdf$")

# Iterate over the PDF filenames and move PDFs containing the string "China" to the China PDF folder
for (pdf_filename in pdf_filenames) {
  # Extract the text from the PDF using the 'pdf_text' function from the 'pdftools' package
  pdf_text <- pdf_text(pdf_filename)
  
  # Check if the PDF contains the string "China" by searching for the string in the text
  if (grepl("China", pdf_text, ignore.case = TRUE)) {
    # Move the PDF containing the string "China" to the China PDF folder
    file.rename(pdf_filename, file.path(china_pdf_folder, basename(pdf_filename)))
  }
}

# Install the 'tm' and 'magrittr' packages if they are not already installed
install.packages(c("tm", "magrittr"))

# Load the 'tm' and 'magrittr' packages
library(tm)
library(magrittr)

# Set the path to the folder containing the PDFs
pdf_folder <- "fara/registrations/pdfs"

# Set the path to the folder where you want to save the PDFs without searchable text
no_text_pdf_folder <- "fara/registrations/pdfs/notext"

# Scan the PDF folder and extract a list of PDF filenames
pdf_filenames <- list.files(pdf_folder, full.names = TRUE, pattern = "\\.pdf$")

# Iterate over the PDF filenames and move PDFs without searchable text to the no text PDF folder
for (pdf_filename in pdf_filenames) {
  # Extract the text from the PDF using the 'readPDF' function from the 'tm' package
  pdf_text <- readPDF(control = list(text = "-layout"))(pdf_filename)
  
  # Check if the PDF contains any searchable text by checking if the length of the text is greater than zero
  if (nchar(pdf_text) == 0) {
    # Move the PDF without searchable text to the no text PDF folder
    file.rename(pdf_filename, file.path(no_text_pdf_folder, basename(pdf_filename)))
  }
}

# Install the 'tm' and 'magrittr' packages if they are not already installed
install.packages(c("tm", "magrittr"))

# Load the 'tm' and 'magrittr' packages
library(tm)
library(magrittr)

# Set the path to the folder containing the PDFs
pdf_folder <- "fara/registrations/pdfs"

# Set the path to the folder where you want to save the PDFs without searchable text
no_text_pdf_folder <- "fara/registrations/pdfs/notext"

# Set the path to the folder where you want to save the PDFs that could not be processed
error_pdf_folder <- "fara/registrations/pdfs/unreadable"

# Scan the PDF folder and extract a list of PDF filenames
pdf_filenames <- list.files(pdf_folder, full.names = TRUE, pattern = "\\.pdf$")

# Iterate over the PDF filenames and move PDFs without searchable text to the no text PDF folder
for (pdf_filename in pdf_filenames) {
  # Extract the text from the PDF using the 'readPDF' function from the 'tm' package
  pdf_text <- readPDF(control = list(text = "-layout"))(pdf_filename)
  
  # Check if the PDF contains any searchable text by checking if the length of the text is greater than zero
  if (nchar(pdf_text) == 0) {
    # Move the PDF without searchable text to the no text PDF folder
    file.rename(pdf_filename, file.path(no_text_pdf_folder, basename(pdf_filename)))
  } else if (class(pdf_text) == "try-error") {
    # If the 'readPDF' function returned an error, move the PDF to the error PDF folder
    file.rename(pdf_filename, file.path(error_pdf_folder, basename(pdf_filename)))
  }
}

library(pdftools)
subfolder <- file.path("fara", "registrations", "pdfs")
files <- list.files(subfolder, pattern = "*.pdf")

# Create an empty vector to store the names of the damaged PDF files
damaged <- c()

# Loop through the PDF files
for (file in files) {
  # Extract the text from the file
  text <- tryCatch(pdf_text(file), error = function(e) e)
  
  # If the text extraction fails, add the file to the damaged vector
  if (inherits(text, "china")) {
    damaged <- c(damaged, file)
  }
}

# Print the names of the damaged PDF files
print(damaged)

poke <- pdf_text("fara/registrations/pdfs/6328-Amendment-20200203-15.pdf")
head(poke)


# Print the names of the PDF files that contain the word
print(results)

# List all PDF files in the working directory
files <- list.files(pattern = "*.pdf")

# Create an empty vector to store the names of the damaged PDF files
damaged <- c()

# Loop through the PDF files
for (file in files) {
  # Extract the text from the file
  text <- tryCatch(pdf_text(file), error = function(e) e)
  
  # If the text extraction fails, add the file to the damaged vector
  if (inherits(text, "error")) {
    damaged <- c(damaged, file)
  }
}

# Print the names of the damaged PDF files
print(damaged)
