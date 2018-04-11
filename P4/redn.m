function out = redn(Theta1, Theta2, X)
# Preparamos a1 añadiendo los unos correspondientes
X = [ones(rows(X),1), X];
# Calculamos a2 segun la formula vista en el enunciado
aux = sigm(X * Theta1');
# Concatenamos los unos correspondientes
aux = [ones(rows(aux),1), aux];
# Calculamos h(x)
results = sigm(aux * Theta2');
# Obtenemos los indices correspondientes al maximo de cada fila, los cuales
# indican que clases interpreta esta red neuronal para cada ejemplo
[max_value, max_index] = max(results, [], 2);
out = max_index;
endfunction