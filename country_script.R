youtube<- read.csv("~/Desktop/Global YouTube Statistics.csv")
library(ggplot2)
ggplot(youtube, aes(x = Country, fill = Country)) + 
  geom_histogram(stat = "count") + 
  labs(title = "Number of Channels by Country", xlab = "Country", ylab = "Number of Channels") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1),  plot.background = element_rect(fill = "white"))
ggsave("country.png", width = 12, height = 8)