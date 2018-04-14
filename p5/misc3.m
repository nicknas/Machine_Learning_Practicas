# fmincg
[Xt, mu, sigma] = genera(X, 8);
opciones = optimset('GradObj', 'on', 'MaxIter', 50);
theta = fmincg(@(t)(coste_rlr([ones(12, 1),Xt], y, t, 0)), [0;0;0;0;0;0;0;0;0], opciones)

plot(X, y, 'rx', 'MarkerSize', 8, 'LineWidth', 1);
hold on;
plotFit(min(X), max(X), mu, sigma, theta, 8);
hold off;

[tr_error val_error] = curvas_polinomios(X, y, Xval, yval)
plot(1:12, tr_error, 'c', 'LineWidth', 1);
xlabel('Num. de ejemplos de entrenamiento (x)');
ylabel('Error (y)');
hold on;
plot(1:12, val_error, 'g', 'LineWidth', 1);
legend ({"Entrenamiento"}, "Validacion");
hold off;