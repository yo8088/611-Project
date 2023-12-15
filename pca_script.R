library(ggplot2)
youtube<- read.csv("~/Desktop/Global YouTube Statistics.csv")
channels_only<- subset(youtube, video.views != 0)
channels_only<- subset(channels_only, select = -c(subscribers_for_last_30_days)) #Remove the "subscribers for last 30 days" variable, as it has many missing values
channels_only<- channels_only[complete.cases(channels_only$country_rank), ] #Remove channels without an associated country
youtube_numeric<- channels_only[sapply(channels_only, is.numeric)]
youtube_numeric <- na.omit(youtube_numeric)
pca_result <- prcomp(youtube_numeric, scale = TRUE)
scores <- as.data.frame(pca_result$x[, 1:2])
pca_plot <- ggplot(scores, aes(x = PC1, y = PC2)) +
  geom_point() +
  labs(title = "PCA Plot of Your Dataset",
       x = "Principal Component 1",
       y = "Principal Component 2")
ggsave("pca.png", width = 12, height = 8)