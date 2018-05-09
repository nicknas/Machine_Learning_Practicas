%Funcion que calcula aquel centroide mas cercano a cada ejemplo de X
function idx = findClosestCentroids(X, centroids)
  %Calculamos K
  K = rows(centroids);
  %Calculamos m
  m = rows(X);
  %Iniciamos idx
  idx = zeros(m, 1);
  for i = 1:m
    min_ci = inf;
    min_idx = 1;
    xi = X(i, :);
    %Para cada fila de centroide, se realiza el cuadrado de las diferencias según la fórmula
    for j = 1:K
      uj = centroids(j, :);
      ci = abs(xi - uj) * abs(xi - uj)';
      %Si de momento es la minima diferencia, se guarda el indice como posible minimo
      if (ci < min_ci)
      {
        min_ci = ci;
        min_idx = j;
      }
    end
    idx(i) = min_idx;
  end
end