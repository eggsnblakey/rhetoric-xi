library(dplyr)
library(readr)

# Set the path to the subfolder
subfolder <- "txt/xi-speech"

# Get a list of all the CSV files in the subfolder
csv_files <- list.files(subfolder, pattern = "*.csv", full.names = TRUE)

# Initialize an empty data frame
df_combined <- data.frame()

# Loop through the CSV files and bind the rows to the combined data frame
for (file in csv_files) {
  df <- read_csv(file)
  df_combined <- bind_rows(df_combined, df)
}

write_csv(df_combined, "txt/xi-speech/combined_data.csv")