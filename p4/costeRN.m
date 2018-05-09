function [J grad] = costeRN(params_rn, num_entradas, num_ocultas, num_etiquetas, X, y, lambda)
Theta1 = reshape(params_rn(1:num_ocultas * (num_entradas + 1)), num_ocultas, (num_entradas + 1));
Theta2 = reshape(params_rn((1 + (num_ocultas  * (num_entradas + 1))):end), num_etiquetas, (num_ocultas + 1));
y = y == [1:num_etiquetas];
A1 = [ones(rows(X), 1) X];
Z2 = A1 * Theta1';
A2 = [ones(size(Z2, 1), 1) sigm(Z2)];
Z3 = A2*Theta2';
h = A3 = sigm(Z3);
J = sum(sum((-y).*log(h) - (1-y).*log(1-h))) / rows(X) + (lambda/(2*rows(X)))*(sum(sum(Theta1(:, 2:end).^2, 2)) + sum(sum(Theta2(:,2:end).^2, 2)));
Sigma3 = A3 - y;
Sigma2 = (Sigma3*Theta2 .* sigm_derivada([ones(size(Z2, 1), 1) Z2]))(:, 2:end);
Delta_1 = Sigma2'*A1;
Delta_2 = Sigma3'*A2;
Theta1_grad = Delta_1 / (rows(X)) + (lambda / (rows(X)))*[zeros(size(Theta1,1), 1) Theta1(:, 2:end)];
Theta2_grad = Delta_2 / (rows(X)) + (lambda / (rows(X)))*[zeros(size(Theta2,1), 1) Theta2(:, 2:end)];
grad = [Theta1_grad(:) ; Theta2_grad(:)];

endfunction
