function theta = descenso_gradiente(x, y, theta_init, alpha, n) 
	m = length(x);
	theta = theta_init;
	hx = ([ones(1,m);x])';
	y = y';
	for i = 1:n
		inter = hx * theta - y;  
    theta = theta - alpha * (1 / m) * ([ones(1, m); x] * inter)
    
    # funcion de coste
    calcular_coste(x, y, theta)
  endfor	
  
endfunction