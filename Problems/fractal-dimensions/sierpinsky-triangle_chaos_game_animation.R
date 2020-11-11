if (require("pacman")) {
    library(pacman)
  }else{
    install.packages("pacman")
    library(pacman)
  }
  pacman::p_load(tidyverse)


n <- 3000
df <- data.frame("xval"=1:n, "yval"=1:n)

x <- c(runif(1), runif(1))
A <- c(0, 0)
B <- c(1, 0)
C <- c(0.5, sin(pi/3))
points <- list()
points <- list(points, x)


for (i in 1:n) {
    dice = sample(1:3, 1)
    if (dice == 1) {
        x <- (x + A)/2
        df[i,] <- x
    } else if (dice == 2) {
        x <- (x + B)/2
        df[i,] <- x
    } else {
        x <- (x + C)/2
        df[i,] <- x
    }
}



vals <- round(seq(from = 1, to = nrow(df), length.out = 200))
# df
for (i in vals) {

  print(i)
    p <- ggplot(df[1:i,], aes(x = xval, y = yval)) +
        geom_point(size = 1, col = "cadet blue") +
        theme(legend.position = "none",
                panel.grid = element_blank(),
                axis.title = element_blank(),
                axis.text = element_blank(),
                axis.ticks = element_blank(),
                panel.background = element_blank()
                )

  filename = paste0("/dev/shm/plots/00000", sprintf("%03d", i), ".png")
  ggsave(file = filename, plot = p, width = 10, height = 10)

}
