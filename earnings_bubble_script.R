library(ggplot2)
youtube<- read.csv("~/Desktop/Global YouTube Statistics.csv")
channels_only<- subset(youtube, video.views != 0)
channels_only$log_video.views<- log(channels_only$video.views)
channels_only$log_subscribers<- log(channels_only$subscribers)
channels_only<- subset(channels_only, log_video.views > 15) #Remove outliers
nonzero<- subset(channels_only, highest_yearly_earnings >= 1) #Remove values equal to zero, as they cannot be log transformed
nonzero$log_highest_yearly_earnings<- log(nonzero$highest_yearly_earnings)
ggplot(data = nonzero, aes(x = log_subscribers, y = log_highest_yearly_earnings, size = uploads)) +
  geom_point(alpha = 0.2, color = "red") +
  scale_size_continuous(range = c(3, 10))
ggsave("Figures/earnings_bubble.png", width = 12, height = 8)