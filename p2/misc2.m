#Parte 2
source("sigm.m");
source("coste_reg.m");
source("mapFeature.m");
source("plotDecisionBoundary.m");

# Cargar datos
d2 = load("ex2data2.txt");
d2X = d2(:,1:2);
d2y = d2(:,3);

# Prueba 1
d2X_entera = [ones(1, length(d2X))', d2X];
%coste_reg(0, [0;0;0], d2X_entera, d2y);

# Prueba 2
d2XReg = mapFeature(d2X(:,1), d2X(:, 2));
%coste_reg(1, zeros(28,1), d2XReg, d2y);

# fminunc
opciones = optimset('GradObj', 'on', 'MaxIter', 400);
[theta, cost] = fminunc(@(t)(coste_reg(0, t, d2X_entera, d2y)), [0;0;0], opciones)

# Graficar datos con theta
plotDecisionBoundary(theta, d2X_entera, d2y);