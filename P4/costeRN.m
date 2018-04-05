function [J grad] = costeRN(params_rn, num_entradas, num_ocultas, num_etiquetas, X, y, lambda)
Theta1 = reshape(params_rn(1:num_ocultas * (num_entradas + 1)), num_ocultas, (num_entradas + 1));
Theta2 = reshape(params_rn((1 + (num_ocultas  * (num_entradas + 1))):end), num_etiquetas, (num_ocultas + 1));
h = redn(Theta1, Theta2, X) == [1:num_etiquetas];
y = y == [1:num_etiquetas];
J = sum(sum(-y * log(h) - (1 - y) * log(1 - h))) / rows(X);
grad = 0;
endfunction
