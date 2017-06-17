function [J, grad] = costFunction(theta, X, y)
%%Função que executa a otimizaçao do custo usando gradientDescent, argmin.
m = length(y); 

 
J = 0;
grad = zeros(size(theta));



prod1 = -1 * (y .* log(sigmoid(X * theta)));
prod2 = (1 - y) .* log(1 - sigmoid(X * theta));

J = sum(prod1 - prod2) / m;

grad = (X' * (sigmoid(X * theta) - y)) * (1/m);



end
