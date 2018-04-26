[X_easy, y_easy] = processDataSet("easy_ham", 5551, false);
[X_hard, y_hard] = processDataSet("hard_ham", 250, false);
[X_spam, y_spam] = processDataSet("spam", 500, true);

n_train_easy = 0.7 * rows(X_easy);
n_train_hard = 0.7 * rows(X_hard);
n_train_spam = 0.7 * rows(X_spam);

X_train = [ X_easy(1:n_train_easy, :); X_hard(1:n_train_hard, :); X_spam(1:n_train_spam, :) ];
Y_train = [ y_easy(1:n_train_easy, :); y_hard(1:n_train_hard, :); y_spam(1:n_train_spam, :) ];
X_valid = [ X_easy((n_train_easy + 1):end, :); X_hard((n_train_hard + 1):end, :); X_spam((n_train_spam + 1):end, :) ];
Y_valid = [ y_easy((n_train_easy + 1):end, :); y_hard((n_train_hard + 1):end, :); y_spam((n_train_spam + 1):end, :) ];

C = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
for i = 1:length(C)
  model = svmTrain(X_train, Y_train, C(i), @linearKernel, 0.001, 30);
  acc_lineal(i) = sum(svmPredict(model, X_valid) == Y_valid) / rows(X_valid);
  model = svmTrain(X_train, Y_train, C(i), @(X, Y) @gaussianKernel(X, Y, 0.1), 0.001, 30);
  acc_gaussian(i) = sum(svmPredict(model, X_valid) == Y_valid) / rows(X_valid);
endfor

acc_lineal
acc_gaussian

endfunction