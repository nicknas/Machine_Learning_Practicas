function coste_multivariable = calcular_coste_multivariable(x, y, theta)
  m = length(x);
  coste_multivariable = ((x * theta - y)' * (x * theta - y)) ./ (2 * m);
endfunction