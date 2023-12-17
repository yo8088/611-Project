library(ggplot2)
youtube<- read.csv("~/Desktop/Global YouTube Statistics.csv")
ggplot(youtube, aes(subscribers, video.views)) +
  geom_point(aes(color = subscribers)) +
  labs(x = "Subscribers", y = "Video Views")
channels_only<- subset(youtube, video.views != 0)
channels_only$log_video.views<- log(channels_only$video.views)
channels_only$log_subscribers<- log(channels_only$subscribers)
channels_only<- subset(channels_only, log_video.views > 15) #Remove outliers
ggplot(data = channels_only, aes(x = log_subscribers, y = log_video.views, size = uploads)) +
  geom_point(alpha = 0.2, color = "blue") +
  scale_size_continuous(range = c(3, 10))
ggsave("Figures/bubble.png", width = 12, height = 8)