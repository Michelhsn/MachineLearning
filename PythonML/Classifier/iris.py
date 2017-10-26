
# Exemplo Classifier com base de dados iris
import numpy as np
import graphviz 
from sklearn.datasets import load_iris
from sklearn import tree

# Carregando base de dados
iris = load_iris()
print (iris.feature_names)
print (iris.target_names)

## Imprimindo dados

# Da feature
print (iris.data[0])

# Do resultado, entre 0 e 2
# onde 0 -> setosa...
print (iris.target[0])

# Imprimindo todo dataset

for i in range(len(iris.target)):
    print ("Linha %d: Resultado %s, dados %s" % (i, iris.target[i], iris.data[i]))

## Treinando dados

# Variável teste
# Para cada linha um resultado diferente
# setosa->0, etc...
test = [0, 50, 100]

# Conjunto de dados para treinamento
# deletando as 3 linhas
train_result = np.delete(iris.target, test)
train_dados = np.delete(iris.data, test, axis=0)

# Dados de Teste
test_result = iris.target[test]
test_dados = iris.data[test]

# Treinando
clf = tree.DecisionTreeClassifier()
clf.fit(train_dados, train_result)

# Imprimindo
print (test_result)
print (clf.predict(test_dados))

