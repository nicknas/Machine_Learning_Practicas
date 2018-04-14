# Generación de nuevos atributos y posterior normalizacion
# a partir de una matriz X que contiene ejemplos de entrenamiento
# con tan solo un atributo
function [Xt, mu, sigma] = genera(X, p)
	Xt = X;
	for i = 2:p
		Xt = [Xt, X .^ i];
	endfor
	[Xt, mu, sigma] = featureNormalize(Xt);
endfunction