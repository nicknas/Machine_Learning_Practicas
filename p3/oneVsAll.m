# Función encargada de devolver un clasificador entrenado con regresion logistica
function [all_theta] = oneVsAll(X, y, num_etiquetas, lambda)
  m = size(X, 1);
  n = size(X, 2);
  
  #Codigo expuesto en el enunciado
  initial_theta = zeros(n + 1, 1);
  options = optimset('GradObj', 'on', 'MaxIter', 50);
  
  #Para cada clase c, se compara con el vector y para conseguir aquellos que concuerden con la clase
  for c = 1:num_etiquetas
    [theta] = fmincg (@(t)(lrCostFunction(t, X, (y == c), lambda)), initial_theta, options);
    # Se va guardando en cada fila de all_theta el valor optimizado
    all_theta(c, :) = theta';
  end
end