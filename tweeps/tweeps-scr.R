library(rtweet)
library(ggplot2)
library(tidyverse)
auth <- rtweet_app()
<<<<<<< HEAD
tmls <- get_timelines(c("ChineseEmbinUS"), n = 100)
=======
tmls <- get_timelines(c("ChineseEmbinUS"), n = 1000)
>>>>>>> b5d8dcf (update)
tmls = data.frame(lapply(tmls, as.character), stringsAsFactors=FALSE)
write.csv(tmls, file = "tweeps/export/burpy.csv")
