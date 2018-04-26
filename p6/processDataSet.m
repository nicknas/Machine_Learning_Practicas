function [X, Y] = processDataSet(dir, num_of_files, spam)
X = [];

# Generacion del diccionario por motivos de eficiencia
vocabulary_list = getVocabList();
for i=1:length(vocabulary_list)
  vocabulary.(vocabulary_list{i})=i;
endfor

# En cada iteracion se procesa un archivo
for i= 1:num_of_files
  # Generamos el nombre del archivo
  file_name = strcat(dir, "/", num2str(i, "%04d"), ".txt");
  # Leemos y procesamos el archivo
  plain_text = processEmail(readFile(file_name));
  newX = zeros(1, length(vocabulary_list));
  # Procesamos cada token generando un vector de 0s y 1s de la longitud del
  # diccionario
	while !isempty(plain_text)
	  [str, plain_text] = strtok(plain_text, [' ']);
	  if isfield(vocabulary, str)
		  newX(vocabulary.(str))=1;
	  endif
	endwhile
  X = [X ; newX];
endfor

# Generamos el vector que indica si es spam (1s) o no (0s)
if (spam) 
  Y = ones(rows(X),1);
else
  Y = zeros(rows(X),1);
endif

endfunction
