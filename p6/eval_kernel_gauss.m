% Función que calcula C y sigma optimizados 
function [C, sigma] = eval_kernel_gauss(X, y, Xval, yval)

  datos = [0.01 0.03 0.1 0.3 1 3 10 30];
  dif_min = inf;

  %Recorremos todos los posibles valores
  for C = datos
    for sigma = datos
      fprintf('.');
      model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
      %Miramos cuanta diferencia hay entre la y generada y la y de validacion
      dif = mean(double(svmPredict(model, Xval) ~= yval));
      %Si la diferencia es mas pequeña que la minima que hemos guardado, guardamos c y sigma minimos
      if( dif <= dif_min )
        C_min = C;
        sigma_min = sigma;
        dif_min = dif;
      end
    end
  end
  C = C_min;
  sigma = sigma_min;

end