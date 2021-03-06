function [tr_error val_error] = curvas_polinomios(X, y, Xval, yval)
  [Xt, mu, sigma] = genera(X, 8);
  Xvalt = (genera_sin_norm(Xval, 8) - mu) ./ sigma;
  opciones = optimset('GradObj', 'on', 'MaxIter', 400);
  # Inicializamos los vectores de errores
  tr_error = zeros(rows(X), 1);
  val_error = zeros(rows(X), 1);
  for i = 1:rows(X)
  	# Obtenemos una hipotesis que se deberia ajustar mas o menos bien al subconjunto
  	theta = fmincg(@(t)(coste_rlr([ones(i, 1),Xt(1:i, :)], y(1:i), t, 0)), [0;0;0;0;0;0;0;0;0], opciones);
	# Calculamos el error sobre el subconjunto de entrenamiento
	[tr_error(i) trash] = coste_rlr([ones(i, 1),Xt(1:i, :)], y(1:i), theta, 0);
	# Calculamos el error sobre todo el conjunto de ejemplos de validacion
	[val_error(i) trash] = coste_rlr([ones(rows(Xvalt), 1),Xvalt], yval, theta, 0);
  endfor
endfunction