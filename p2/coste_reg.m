function [J, grad] = coste_reg(lambda, theta, X, y)
	m = length(X);
	n = length(theta);
	aux1 = sigm(X * theta);
	J = sum((-y .* log(aux1) - (1 - y) .* log(1 - aux1))) ./ m + lambda * sum(realpow(theta, 2)) ./ (2 * m);
	aux2 = sum((aux1 - y) .* X(:, 1:n)) ./ m;	
	grad = aux2 + (lambda .* [0; theta(2:n)] ./ m)';
end
