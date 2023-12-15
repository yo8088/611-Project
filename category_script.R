youtube<- read.csv("~/Desktop/Global YouTube Statistics.csv")
library(ggplot2)
ggplot(youtube, aes(x = category, fill = category)) + 
  geom_histogram(stat = "count") + 
  labs(title = "Number of Channels by Channel Category", xlab = "Country", ylab = "Number of Channels") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1),  plot.background = element_rect(fill = "white"))
ggsave("Figures/category.png", width = 12, height = 8)