function [J, grad] = coste_reg(lambda, theta, X, y)
	m = length(X);
	n = length(theta);
	X = [ones(1, m)', X];
	aux = sigm(X * theta);
	J = sum((-y .* log(aux) - (1 - y) .* log(1 - aux))) ./ m + lambda * sum(realpow(theta, 2)) ./ (2 * m);
	grad = sum((aux - y) .* X(:, 1:n)) ./ m + lambda .* theta ./ m;
end
