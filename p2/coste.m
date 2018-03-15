function [J, grad] = coste(theta, X, y)
	m = length(X);
	n = length(theta);
	X = [ones(1, m)', X];
	aux = sigm(X * theta);
	J = sum((-y .* log(aux) - (1 - y) .* log(1 - aux))) / m;
	grad = sum((aux - y) .* X(:, 1:n)) ./ m;
end