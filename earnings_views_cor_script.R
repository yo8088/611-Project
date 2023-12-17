library(ggplot2)
youtube<- read.csv("~/Desktop/Global YouTube Statistics.csv")
channels_only<- subset(youtube, video.views != 0)
channels_only$log_video.views<- log(channels_only$video.views)
channels_only$log_subscribers<- log(channels_only$subscribers)
channels_only<- subset(channels_only, log_video.views > 15) #Remove outliers
nonzero<- subset(channels_only, highest_yearly_earnings >= 1) #Remove values equal to zero, as they cannot be log transformed
nonzero$log_highest_yearly_earnings<- log(nonzero$highest_yearly_earnings)
ggplot(nonzero, aes(log_video.views, log_highest_yearly_earnings)) +
  geom_point(aes(color = log_highest_yearly_earnings)) +
  labs(x = "Log Video Views", y = "Highest Log Yearly Earnings")
ggsave("Figures/earnings_views_cor.png", width = 12, height = 8)