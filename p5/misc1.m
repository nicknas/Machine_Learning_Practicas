[J, g] = coste_rlr([ones(12, 1),X], y, [1;1], 1)

# fmincg
opciones = optimset('GradObj', 'on', 'MaxIter', 400);
theta = fmincg(@(t)(coste_rlr([ones(12, 1),X], y, t, 0)), [0;0], opciones)

# plot
plot(X, y, 'rx', 'MarkerSize', 8, 'LineWidth', 1);
hold on;
plot(X, [ones(12, 1) X]*theta, 'LineWidth', 1);
hold off;