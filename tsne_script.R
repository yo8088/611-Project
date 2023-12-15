youtube<- read.csv("~/Desktop/Global YouTube Statistics.csv")
library(tsne)
library(ggplot2)
channels_only<- subset(youtube, video.views != 0)
channels_only<- subset(channels_only, select = -c(subscribers_for_last_30_days)) #Remove the "subscribers for last 30 days" variable, as it has many missing values
channels_only<- channels_only[complete.cases(channels_only$country_rank), ] #Remove channels without an associated country
youtube_numeric<- channels_only[sapply(channels_only, is.numeric)]
youtube_numeric <- na.omit(youtube_numeric)
tsne_result<- tsne(youtube_numeric)
tsne_data <- data.frame(X = tsne_result[, 1], Y = tsne_result[, 2])
ggplot(tsne_data, aes(x = X, y = Y, color = factor(row.names(tsne_data)))) +
  geom_point() + 
  ggtitle("t-SNE Visualization")
ggsave("Figures/tsne.png", width = 12, height = 8)
