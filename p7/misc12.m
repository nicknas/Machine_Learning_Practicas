# Lectura y cambio de matriz 3D a matriz 2D
A = double(imread('bird_small.png'));
A = A / 255;
imagesc(A);
A2D = reshape(A, 128 * 128, 3);

# Generemos los centroides iniciales de manera aleatoria
random_indexes = randperm(rows(A2D), 16);
centroids_in = A2D(random_indexes, :);

# Llamada a k-means
[centroids_out, idx] = runkMeans(A2D, centroids_in, 12, false);

# Conversion de la salida a imagen visualizable
A_out = centroids_out(idx, :);
A_out = reshape(A_out, 128, 128, 3);

imagesc(A_out);