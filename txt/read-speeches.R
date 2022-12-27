library(rvest)
library(readr)
library(dplyr)

testy_xi <- read_html("https://www.fmprc.gov.cn/mfa_eng/wjdt_665385/zyjh_665391/")

links <- html_nodes(testy_xi, "a")

hrefs <- html_attr(links, "href")

selected <- grep("https://www.fmprc.gov.cn/mfa_eng/", hrefs, value = TRUE)

