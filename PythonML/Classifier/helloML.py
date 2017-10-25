from sklearn import tree


### Prever a nome da matéria, baseado na nota e nas horas de estudo
### dados = [Nota, HorasDeEstudo] ; resultado = [Materia]
### sendo 1 para RH e 0 para WebII :D :D :'(

dados = [[10, 3], [8,2], [9, 2], [5, 5], [4, 3], [6, 7]]
resultados = [1, 1, 1, 0, 0, 0]

algotree = tree.DecisionTreeClassifier()

# Treinando

decisao = algotree.fit(dados, resultados)

# Buscando nota e horas estudadas do usuário
dadosUsuario = []


x = int(input('Digite nota que tirou na prova'))
dadosUsuario.append(x)

y = int(input('Digite quantas horas estudou para a prova'))
dadosUsuario.append(x)


#Imprimindo decisão

if (decisao.predict([dadosUsuario]) == [1]):
	print ("Você fez prova de RH")
else:
	print ("Você fez prova de WebII")


