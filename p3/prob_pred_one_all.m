#Calcula el porcentaje de aciertos en las predicciones despues de haber calculado el clasificador
function porcentaje = prob_pred_one_all(X, y, all_theta)
  m = size(X, 1);
  X = [ones(m, 1) X];

  pred = sigm(X * all_theta');
  # Se emplea la funcion max para conseguir la clase mas optimizada en cada ejemplo de entrenamiento
  [pred_max, index_max] = max(pred, [], 2);
  p = index_max;
  
  # Porcentaje de aciertos
  porcentaje = (sum(p == y) / m) * 100;

end 