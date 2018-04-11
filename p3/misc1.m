load('ex3data1.mat');

#Código que se incluye en el enunciado para visualizar 100 numeros al azar
%m = size(X, 1);
%rand_indices = randperm(m);
%sel = X(rand_indices(1:100), :);
%displayData(sel);

[all_theta] = oneVsAll(X, y, 10, 0.1)
porcentaje = prob_pred_one_all(X, y, all_theta)
