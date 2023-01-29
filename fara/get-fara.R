<<<<<<< HEAD
# This returns a CSV file that includes all the FARA docs for a specified registratant

library(httr)

# Set the API endpoint URL
url <- "https://efile.fara.gov/api/v1/RegDocs/csv/6584"

# Make the GET request
response <- GET(url)

# Check the status code of the response
status_code <- status_code(response)

# If the status code is 200, the request was successful
if (status_code == 200) {
  # Process the response
  response_data <- content(response, as = "text")
  print(response_data)
} else {
  # There was an error with the request
  print(paste("Request failed with status code", status_code))
}

head(response)
writeLines(response_data, "response6584.csv")
=======
# This returns a CSV file that includes all the FARA docs for a specified registratant

library(httr)

# Set the API endpoint URL
url <- "https://efile.fara.gov/api/v1/RegDocs/csv/5430"

# Make the GET request
response <- GET(url)

# Check the status code of the response
status_code <- status_code(response)

# If the status code is 200, the request was successful
if (status_code == 200) {
  # Process the response
  response_data <- content(response, as = "text")
  print(response_data)
} else {
  # There was an error with the request
  print(paste("Request failed with status code", status_code))
}

head(response)
writeLines(response_data, "response5430.csv")
>>>>>>> main
