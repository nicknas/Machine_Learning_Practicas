source("sigm.m");
source("coste.m");
source("mapFeature.m");
source("plotDecisionBoundary.m");

# Cargar datos
d1 = load("ex2data1.txt");
d1X = d1(:,1:2);
d1y = d1(:,3);

# Graficar datos
negativos = find(d1y==0);
plot(d1X(negativos, 1), d1X(negativos,2), 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7);
positivos = find(d1y==1);
plot(d1X(positivos, 1), d1X(positivos,2), 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7);

# Funcion de coste
coste([0;0;0], d1X, d1y);

# fminunc
opciones = optimset('GradObj', 'on', 'MaxIter', 400);
[theta, cost] = fminunc(@(t)(coste(t, d1X, d1y)), [0; 0; 0], opciones);

# Graficar datos con theta
d1X_entera = [ones(1, length(d1X))', d1X];
plotDecisionBoundary(theta, d1X_entera, d1y);

# Porcentaje
eval(theta, d1X, d1y);