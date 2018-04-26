
% Código empleado del enunciado para entrenar los datos con el kernel gaussiano y representarlo gráficamente
load("ex6data3.mat");
[C, sigma] = eval_kernel_gauss(X, y, Xval, yval);
model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
visualizeBoundary(X, y, model);