function theta = descenso_gradiente_multivariable(x, y, theta_init, alpha, n)
  m = columns(x);
	theta = theta_init;
  [x_norm, mu, sigma] = normaliza_atributo(x');
	hx = ([ones(1,m);(x_norm)'])';
	y = y';
	for i = 1:n
		inter = hx * theta - y;  
    theta = theta - alpha * (1 / m) * ([ones(1, m); x] * inter)
    
    # funcion de coste multivariable
    calcular_coste_multivariable(hx, y, theta)
  endfor
  
endfunction