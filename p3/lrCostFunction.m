# Funcion encargada de realizar el coste con regularizacion, usada de la practica anterior
function [J, grad] = lrCostFunction(theta, X, y, lambda)
	m = size(X, 1);
  X = [ones(m, 1) X];
	n = length(theta);
	aux1 = sigm(X * theta);
  #Calculo del coste
	J = sum((-y .* log(aux1) - (1 - y) .* log(1 - aux1))) ./ m + lambda * sum(realpow(theta, 2)) ./ (2 * m);
	aux2 = sum((aux1 - y) .* X(:, 1:n)) ./ m;	
  #Calculo del gradiente, devolviendolo en vector columna
	grad = (aux2 + (lambda .* [0; theta(2:n)] ./ m)')';
end
