lambdas = [0, 0.001, 0.003, 0.01, 0.03, 0.1, 0.3, 1,3, 10];
[tr_error val_error] = errores_lambda(X, y, Xval, yval, lambdas)
plot(lambdas, tr_error, 'c', 'LineWidth', 1);
xlabel('lambda (x)');
ylabel('Error (y)');
hold on;
plot(lambdas, val_error, 'g', 'LineWidth', 1);
legend ({"Entrenamiento"}, "Validacion");
hold off;

opciones = optimset('GradObj', 'on', 'MaxIter', 500);
[Xt, mu, sigma] = genera(X, 8);
XtestT = (genera_sin_norm(Xtest, 8) - mu) ./ sigma;
theta = fmincg(@(t)(coste_rlr([ones(rows(Xt), 1),Xt], y, t, 3)), [0;0;0;0;0;0;0;0;0], opciones);
coste_rlr([ones(rows(XtestT), 1),XtestT], ytest, theta, 0);