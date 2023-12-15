youtube<- read.csv("~/Desktop/Global YouTube Statistics.csv")
library(tsne)
channels_only<- subset(youtube, video.views != 0)
channels_only<- subset(channels_only, select = -c(subscribers_for_last_30_days)) #Remove the "subscribers for last 30 days" variable, as it has many missing values
channels_only<- channels_only[complete.cases(channels_only$country_rank), ] #Remove channels without an associated country
youtube_numeric<- channels_only[sapply(channels_only, is.numeric)]
youtube_numeric <- na.omit(youtube_numeric)
plot(tsne_result)