# Generación de nuevos atributos a partir de una matriz X 
# que contiene ejemplos de entrenamiento con tan solo un atributo
function [Xt, mu, sigma] = genera_sin_norm(X, p)
	Xt = X;
	for i = 2:p
		Xt = [Xt, X .^ i];
	endfor
endfunction