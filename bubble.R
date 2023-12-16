library(ggplot2)
youtube<- read.csv("~/Desktop/Global YouTube Statistics.csv")
ggplot(youtube, aes(subscribers, video.views)) +
  geom_point(aes(color = subscribers)) +
  labs(x = "Subscribers", y = "Video Views")
channels_only<- subset(youtube, video.views != 0)
channels_only$log_video.views<- log(channels_only$video.views)
channels_only$log_subscribers<- log(channels_only$subscribers)
channels_only<- subset(channels_only, log_video.views > 15) #Remove outliers
ggplot(channels_only, aes(log_subscribers, log_video.views)) +
  geom_point(aes(color = video.views)) +
  labs(x = "Log Subscribers", y = "Log Video Views")
ggsave("Figures/bubble.png", width = 12, height = 8)