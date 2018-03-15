function out = sigm(z)
	out = 1 ./ (1 + realpow(e, -z));
end