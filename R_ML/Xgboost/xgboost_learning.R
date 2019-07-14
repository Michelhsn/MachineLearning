# data(agaricus.train, package='xgboost')
# data(agaricus.test, package='xgboost')
# train <- agaricus.train
# test <- agaricus.test
library(xgboost)

dados_creditos = read.csv(file.choose(),header = TRUE, sep = ';')
amostras = sample(2, 1000, replace = T, prob = c(0.8,0.2))
dados_treino = dados_creditos[amostras==1,]
dados_teste = dados_creditos[amostras==2,]

matrizData = data.matrix(dados_treino[,-20])

labelNum = as.numeric(dados_treino[,20])%/%2
matrizLabel = data.matrix(labelNum)


matrizTeste = data.matrix(dados_teste[,-20])

labelTeste = as.numeric(dados_teste[,20])%/%2

bstSparse <- xgboost(data = matrizData, label = matrizLabel, max.depth = 2, eta = 1, nthread = 2, nrounds = 2, objective = "binary:logistic")

pred <- predict(bstSparse, matrizTeste[,-20])
print(length(pred))


prediction <- as.numeric(pred > 0.5)

matriz_confusao = table(labelTeste, prediction)
taxa = (matriz_confusao[1]+matriz_confusao[4])/sum(matriz_confusao)
taxa

err <- mean(prediction != labelTeste)
print(paste("test-error=", err))
