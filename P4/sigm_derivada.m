function dg = sigm_derivada(X)
dg = sigm(X) .* (1 - sigm(X));
end