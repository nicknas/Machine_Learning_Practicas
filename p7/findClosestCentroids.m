function idx = findClosestCentroids(X, centroids)
  %Calculamos K
  K = rows(centroids);
  %Calculamos m
  m = rows(X);
  %Iniciamos idx
  idx = zeros(m, 1);
  for i = 1:m
    min_ci = inf;
    xi = X(i, :);
    for j = 1:K
      uj = centroids(j, :);
      ci = (xi' - uj')' * (xi' - uj');
      if (ci < min_ci)
      {
        min_ci = ci;
      }
    end
    idx(i) = min_ci;
  end
end