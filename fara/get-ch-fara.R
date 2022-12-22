library(httr)
library(plyr)

# Initialize an empty data frame to store the results
results <- data.frame()
csv_file <- read.csv("numbers.csv")

# Set the number of requests per pause
requests_per_pause <- 5

# Initialize a counter to keep track of the number of requests
request_counter <- 0

for(i in 1:nrow(csv_file)) {
  # Get the current number
  number <- csv_file$numbers[i]
  
  # Construct the URL with the current number
  url <- sprintf("https://efile.fara.gov/api/v1/RegDocs/csv/%s", number)
  
  # Make the GET request
  response <- GET(url)
  
  # Parse the data from the response into a data frame
  data <- read.csv(text = rawToChar(response$content))
  
  # Increment the request counter
  request_counter <- request_counter + 1
  
  # If the request counter is divisible by the number of requests per pause, pause
  if (request_counter %% requests_per_pause == 0) {
    Sys.sleep(10)
  }
  
  # Add the data to the results data frame
  results <- rbind.fill(results, data)
}

# Write the results to a CSV file
write.csv(results, "results.csv")