# Usando kmeans

iris

summary(iris)

# Criando o objeto cluster

obj_cluster = kmeans(iris[1:4], center = 3)

obj_cluster$cluster


table(iris$Species, obj_cluster$cluster)

plot(iris[,1:4], col = obj_cluster$cluster)
