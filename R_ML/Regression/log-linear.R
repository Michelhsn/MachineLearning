### Autor: Michel Nascimento
### Email: michel_henrique_911@hotmail.com
### Data: 18/10/17

## Análise de Regressão linear GLM * log-log

# Leitura dos dados
data = read.csv(file.choose(), header = T)
head(data)

#Scatter Plot
plot(data, main = "Scatter Plot")

#Pacotes good of fitness
install.packages("hydroGOF")
library("hydroGOF")

#Usando mmq ordinário
model = lm(rsro ~ ppm, data)


#Adiciona a reta do fit
abline(model)

#Calculo do erro - RMSE
Pred = predict(model, data)
RMSE = rmse(Pred, data$ppm)

## Transformação Log-Linear

# Trasformando as variáveis
data$rsro = log(data$rsro, base = exp(1))


#Scatter Plot
plot(rsro ~ ppm, data  = data , main = "Scatter Plot")

#Fit modelo
model1 = lm(rsro ~ ppm, data)
abline(model1)

#Calculo RMSE
Pred1 = predict(model1, data)
RMSE = rmse(Pred1, data$rsro)
