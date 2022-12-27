library(quanteda)
library(readtext)
library(pdftools)

library(pdftools)

files <- list.files(pattern = "fara/registrations/pdfs/china.pdf$")

for (file in files){
  corruptedPdfs <- list()
  
  tryPdfInfo <- tryCatch({
    pdf_info(file)
  }, error=function(e){e}
  )
  
  if(inherits(tryPdfInfo, "error")){
    corruptedPdfs[[file]] <- file
  }
}

print(corruptedPdfs)