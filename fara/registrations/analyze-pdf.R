library(pdftools)


# Get a list of the PDF files in the directory
file_list <- list.files(pattern = "*.pdf")

# Set the directory where you want to save the PDF files
output_dir <- "fara/registrations"

# Loop through each file and extract page 3
for (i in 1:length(file_list)) {
  filename <- file_list[i]
  pdf_page3 <- pdf_subset(filename, pages = 3)
}