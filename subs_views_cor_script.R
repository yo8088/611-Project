library(ggplot2)
youtube<- read.csv("~/Desktop/Global YouTube Statistics.csv")
ggplot(youtube, aes(subscribers, video.views)) +
  geom_point(aes(color = subscribers)) +
  labs(x = "Subscribers", y = "Video Views")
channels_only<- subset(youtube, video.views != 0)
nonzero$log_video.views<- log(nonzero$video.views)
nonzero$log_subscribers<- log(nonzero$subscribers)
ggplot(nonzero, aes(log_subscribers, log_video.views)) +
  geom_point(aes(color = video.views)) +
  labs(x = "Log Subscribers", y = "Log Video Views")
ggsave("Figures/subs_views_cor.png", width = 12, height = 8)