load("ex4data1.mat");
load("ex4weights.mat");
params_rn = [Theta1(:) ; Theta2(:)];
costeRN(params_rn, 400, 25, 10, X, y, 0.1)
