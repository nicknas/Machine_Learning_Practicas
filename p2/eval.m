function out = eval(theta, X, y)
	m = length(X);
	X = [ones(1, m)', X];
	aux = sigm(X * theta);
	aux(aux < 0.5) = 0;
	aux(aux >= 0.5) = 1;
	out = (sum(aux == y) / m) * 100;
end