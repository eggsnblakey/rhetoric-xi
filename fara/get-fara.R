library(httr)

# Set the API endpoint URL
url <- "https://efile.fara.gov/api/v1/RegDocs/csv/6328"

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
writeLines(response_data, "response6328.csv")
