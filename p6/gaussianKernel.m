% Función encargada de calcular la distancia entre dos ejemplos de entrenamiento que no son linealmente separables
function sim = gaussianKernel(x1, x2, sigma)
  sim = exp(-sum((x1 - x2).^2) / (2 * sigma^2))
end 