### Autor: Michel Nascimento
### Email: michel_henrique_911@hotmail.com

## Análise de Regressão logística
## Prática e resultado

# Leitura do arquivo
data1 = read.csv(file.choose(), header = T)
head(data1)

#Scatter Plot
plot(data1$Practice, data1$Outcome, main = "Scatter Plot")

## Fir logistic model
fit = glm(Outcome ~ Practice, family = binomial(link = "logit"), data = data1)

# Plot de probabilidades
plot(data1$Practice, data1$Outcome, main ="Scatter Plot")
curve(predict(fit,data.frame(Practice = x), type = "resp"), add = TRUE) 
points(data1$Practice,fitted(fit),pch=20)

# 1/(1+e^-(a + bx))


