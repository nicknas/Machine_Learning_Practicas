load("ex4data1.mat");
load("ex4weights.mat");
params_rn = [Theta1(:) ; Theta2(:)];

initial_theta = zeros(n + 1, 1);
options = optimset('GradObj', 'on', 'MaxIter', 1);

for c = 1:10
    [theta] = fmincg (@(t)(costeRN(params_rn, 400, 25, 10, X, y, 1)), initial_theta, options);
    # Se va guardando en cada fila de all_theta el valor optimizado
    all_theta(c, :) = theta';
end

X = [ones(rows(X), 1) X];
pred = sigm(X * all_theta');
# Se emplea la funcion max para conseguir la clase mas optimizada en cada ejemplo de entrenamiento
[pred_max, index_max] = max(pred, [], 2);
p = index_max;

# Porcentaje de aciertos
porcentaje = (sum(p == y) / m) * 100