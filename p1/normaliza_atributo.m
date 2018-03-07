function [x_norm, mu, sigma] = normaliza_atributo(x)
  mu = mean(x);
  sigma = std(x);
  x_norm = (x - mu) ./ sigma;
endfunction