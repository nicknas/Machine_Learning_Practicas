function coste = calcular_coste(x, y, theta)
  m = columns(x);
  hx = [ones(1,m); x]';
  coste = sum(realpow((hx * theta - y), 2)) / (2 * m);
endfunction