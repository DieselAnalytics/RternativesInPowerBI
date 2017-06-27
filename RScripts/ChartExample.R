library(ggplot2)
library(dplyr)
library(stringr)
library(lubridate)

theme_set(theme_bw(10))

plot.data <- dataset

top.player <- plot.data[which.max(plot.data$Points), "Player"]
top.points <- plot.data[which.max(plot.data$Points), "Points"]
worse.scorer <- plot.data[which.min(plot.data$Points), "Player"]
opponent <- plot.data[which.max(plot.data$Points), "opponent"]
chart.title = 'Lakers Points per game by Player'
chart.subtitle = paste("The top scorer was ", top.player, ". He scored ", top.points, " against ", opponent, ".", " The lowest scorer was ", worse.scorer, ".", sep = "")

p <- ggplot(plot.data, aes(x = Player, y = Points, color = Player))
p <- p + geom_boxplot()
p <- p + labs(title = chart.title, subtitle = chart.subtitle, caption = "Created by Tank Wade", x = "Player", y = "Points")
p
