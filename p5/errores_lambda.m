function [tr_error val_error] = errores_lambda(X, y, Xval, yval, lambdas)
  [Xt, mu, sigma] = genera(X, 8);
  Xvalt = (genera_sin_norm(Xval, 8) - mu) ./ sigma;
  opciones = optimset('GradObj', 'on', 'MaxIter', 500);
  # Inicializamos los vectores de errores
  tr_error = zeros(length(lambdas), 1);
  val_error = zeros(length(lambdas), 1);
  for i = 1:length(lambdas)
  	# Obtenemos una hipotesis con la lambda correspondiente
  	theta = fmincg(@(t)(coste_rlr([ones(rows(Xt), 1),Xt], y, t, lambdas(i))), [0;0;0;0;0;0;0;0;0], opciones);
	# Calculamos el error con el conjunto de entrenamiento
  	[tr_error(i) trash] = coste_rlr([ones(rows(Xt), 1),Xt], y, theta, 0);
	# Calculamos el error con el conjunto de validacion
	[val_error(i) trash] = coste_rlr([ones(rows(Xvalt), 1),Xvalt], yval, theta, 0);
  endfor
endfunction