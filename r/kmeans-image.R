library(data.table)
library(cluster)
library(ggplot2)

directory <- "~/github-repos/hashcode-2015/data/"
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

cluster <- kmeans(newmelt, 4, iter.max = 20, trace = 1)
melted$cluster <- cluster$cluster

ggplot(melted, aes(Var2,-Var1, fill = cluster)) +
  geom_raster() +
  theme(legend.position="none") +
  coord_fixed(2) + 
  scale_fill_distiller(palette = "Spectral")

melted <- data.table(melted)
submelt <- data.frame(melted[value > 0,])
# submelt <- data.frame(scale(submelt[,c(1,2)]))

hierq <- hclust(dist(submelt[,c(1,2)], method = "manhattan"))

plot(hierq)

hierq <- data.table( order = hierq$order, cluster = cutree(hierq, k = 150) )
setorder(hierq, order)
hierq
submelt$cluster <- hierq$cluster
melted$hcluster <- 0
melted[value > 0,]$hcluster <- submelt$cluster+0.0

ggplot(melted, aes(Var2,-Var1, fill = (hcluster==10)+.0 )) +
  geom_raster() +
  theme(legend.position="none") +
  coord_fixed(2) + 
  scale_fill_distiller(palette = "Spectral")
