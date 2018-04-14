[tr_error val_error] = curvas(X, y, Xval, yval)
plot(1:12, tr_error, 'c', 'LineWidth', 1);
xlabel('Num. de ejemplos de entrenamiento (x)');
ylabel('Error (y)');
hold on;
plot(1:12, val_error, 'g', 'LineWidth', 1);
legend ({"Entrenamiento"}, "Validacion");
hold off;