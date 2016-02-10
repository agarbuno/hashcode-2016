library(data.table)
library(ggplot2)
library(cluster)

directory <- "~/Dropbox/hash-code/"
file <- "logo.in"

data <- fread(paste(directory, file, sep =""), skip = 1, header = F)
databin <- c()

for (i in 1:nrow(data)) {
  databin <- rbind(databin, 
                   as.numeric(as.factor(unlist(strsplit(as.character(data[i,]), ""))))-1)
}

melted <- melt(databin)

ggplot(melted, aes(Var2,-Var1, fill = value)) +
  geom_raster() +
  theme(legend.position="none") +
  coord_fixed(2) +
  scale_fill_distiller(palette = "Spectral")

newmelt <- as.data.frame(scale(melted[,1:2]))
newmelt$value <- 1.5 * melted$value

cluster <- kmeans(newmelt, 25, iter.max = 20, trace = 1)
melted$cluster <- cluster$cluster

ggplot(melted, aes(Var2,-Var1, fill = cluster)) +
  geom_raster() +
  theme(legend.position="none") +
  coord_fixed(2) + 
  scale_fill_distiller(palette = "Spectral")


data <- pam(melted, metric = "manhattan", stand = F, k = 8, trace.lev = 1, cluster.only=TRUE)
melted$cluster <- data

