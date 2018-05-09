# Funcion que vuelve a calcular aquellos centroides óptimos para cada ejemplo
function centroids = computeCentroids(X, idx, K)

[m n] = size(X);

centroids = zeros(K, n);

# Para cada fila de centroide, buscamos aquellos ejemplos que concuerden con los indices guardados en idx
for k = 1:K
  num_k = 0;
  sum = zeros(n, 1)';
  for i = 1:m
    # Si concuerda, realizamos el sumatorio de variables para ese ejemplo 
    if ( idx(i) == k )
      sum = sum + X(i, :);
      num_k = num_k + 1;
    end
  end
  # Al final de cada fila realizamos la media de todas aquellas variables concordantes
  centroids(k, :) = (sum/num_k);
end
end