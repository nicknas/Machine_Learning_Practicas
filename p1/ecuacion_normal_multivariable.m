function theta = ecuacion_normal_multivariable(x, y)
  m = columns(x);
  hx = ([ones(1,m);x])';
  y = y';
  theta = pinv(hx' * hx) * (hx' * y);
  calcular_coste_multivariable(hx, y, theta)
endfunction