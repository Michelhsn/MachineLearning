library(e1071)
library(FSelector)


dados_creditos = read.csv(file.choose(),header = TRUE, sep = ';')
amostras = sample(2, 1000, replace = T, prob = c(0.7,0.3))
amostras
dados_treino = dados_creditos[amostras==1,]
dados_teste = dados_creditos[amostras==2,]

modelo_naive = naiveBayes(CLASSE ~., dados_treino)
modelo_svm = svm(CLASSE ~., dados_treino)
modelo_naive_atr = naiveBayes(CLASSE ~ CHEQUEESPECIAL + USO_CREDITO + HISTORICO_CREDITO + BALANCO_ATUAL 
                              + BALANCO_MEDIO_CREDITO + OUTRASFUNCOES + OUTROSPLANOSPGTO + IDADE
                              + PROPOSITO + TIPOSBENS + EMPREGADO + LOCAL + EMPREGO + RESIDENCIA + TRABAESTRANGEIRO , dados_treino)


previsao_naive = predict(modelo_naive, dados_teste)
previsao_svm = predict(modelo_svm, dados_teste)
previsao_naive_atr = predict(modelo_naive_atr, dados_teste)

matriz_confusao_naive = table(dados_teste$CLASSE, previsao_naive)
matriz_confusao_svm = table(dados_teste$CLASSE, previsao_svm)
matriz_confusao_naive_atr = table(dados_teste$CLASSE, previsao_naive_atr)
#taxa de acerto
taxa_naive = (matriz_confusao_naive[1]+matriz_confusao_naive[4])/sum(matriz_confusao_naive)
taxa_svm = (matriz_confusao_svm[1]+matriz_confusao_svm[4])/sum(matriz_confusao_svm)
taxa_naive_atr = (matriz_confusao_naive_atr[1]+matriz_confusao_naive_atr[4])/sum(matriz_confusao_naive_atr)

taxa_naive
taxa_svm
taxa_naive_atr


atributos_importance = random.forest.importance(CLASSE ~., dados_creditos)

importance_order <- atributos_importance[order(atributos_importance$attr_importance),] 
importance_order

library(xgboost)
library(readr)
library(stringr)
library(caret)
library(car)

xgb <- xgboost(data = data.matrix(dados_treino), 
               label = dados_treino$CLASSE, 
               eta = 0.1,
               max_depth = 15, 
               nround=25, 
               subsample = 0.5,
               colsample_bytree = 0.5,
               seed = 1,
               eval_metric = "merror",
               objective = "multi:softprob",
               num_class = 12,
               nthread = 3
)

y_pred <- predict(xgb, data.matrix(dados_teste))
