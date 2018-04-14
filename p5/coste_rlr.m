function [J g] = coste_rlr(X, y, theta, lambda)
	m = rows(X);
	# Evaluamos la hipotesis para los ejemplos de entrenamiento
	h = X * theta;
	# Calculamos el coste segun la formula
	J = (sum((h - y) .^ 2) + sum([0; lambda * theta(2:end) .^ 2])) / (2 * m);
	# Calculamos el gradiente segun la formula
	g = (sum((h - y) .* X)) / m + [0, lambda * theta(2:end)' / m];
	# A todos las componentes menos la primera les agregamos el termino de regularizacion
	g = g';
endfunction