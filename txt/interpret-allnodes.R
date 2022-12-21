library(rvest)
library(readr)
library(dplyr)

interpret <- "https://interpret.csis.org/translations/analysis-of-changes-in-german-perceptions-of-china/"

webpage <- read_html(interpret, encoding = "UTF-8")

# Select three nodes from the webpage
node1 <- html_nodes(webpage, ".entry-header__title")
node2 <- html_nodes(webpage, ".post-meta__date")
node3 <- html_nodes(webpage, "translations__translation")

# Extract the text from the nodes
node1_text <- html_text(node1)
node2_text <- html_text(node2)
node3_text <- html_text(node3)

# Combine the nodes into a single data frame
df <- bind_cols(node1_text, node2_text, node3_text)

# Write the data frame to a CSV file
write_csv(df, "txt/interpret/combined-interpret.csv")

