library(ggplot2)
youtube<- read.csv("~/Desktop/Global YouTube Statistics.csv")
channels_only<- subset(youtube, video.views != 0)
nonzero<- subset(channels_only, highest_monthly_earnings >= 1)
nonzero<- subset(nonzero, highest_yearly_earnings >= 1)
nonzero$log_video.views<- log(nonzero$video.views)
nonzero$log_subscribers<- log(nonzero$subscribers)
nonzero$norm_subscribers<- scale(nonzero$log_subscribers)
nonzero$norm_video.views<- scale(nonzero$log_video.views)
nonzero$sub_view_diff<- nonzero$norm_video.views - nonzero$norm_subscribers
nonzero<- subset(nonzero, created_year > 2000)
ggplot(nonzero, aes(Urban_population, video.views)) +
  geom_point(aes(color = video.views)) +
  labs(x = "Urban Population", y = "Video Views")
ggsave("Figures/urbanpop_views_cor.png", width = 12, height = 8)
