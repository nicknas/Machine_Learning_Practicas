#Parte 2
source("sigm.m");
source("coste.m");
source("mapFeature.m");
source("plotDecisionBoundary.m");

# Cargar datos
d2 = load("ex2data2.txt");
d2X = d1(:,1:2);
d2y = d1(:,3);

# Prueba 1
coste_reg(0, [0;0;0], d2X, d2y)

# Prueba 2
d2X = mapFeature(d2X(:,1), d2X(:, 2))
coste_reg(1, zeros(28,1), d2X(:, 2:28), d2y)

# fminunc
opciones = optimset('GradObj', 'on', 'MaxIter', 400);
[theta, cost] = fminunc(@(t)(coste_reg(1, t, d2X(:, 2:28), d2y), zeros(28,1), opciones);
[theta, cost] = fminunc(@(t)(coste_reg(1, t, d2X(:, 2:28), d2y)), [0;0;0;0;0;0;0;0;0;0;0;0;0;00;0;0;0;0;0;00;0;0;0;0;0;0], opciones);
