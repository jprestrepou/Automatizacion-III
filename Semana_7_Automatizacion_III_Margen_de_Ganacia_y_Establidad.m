s = tf('s');
G = 10 / (s * (s + 2));

% Calcular márgenes de ganancia y fase
[GM, PM, Wcg, Wcp] = margin(G);

% Mostrar resultados en consola
fprintf('Margen de ganancia: %.2f dB\n', 20*log10(GM));
fprintf('Margen de fase: %.2f°\n', PM);
fprintf('Frecuencia de cruce de ganancia: %.2f rad/s\n', Wcg);
fprintf('Frecuencia de cruce de fase: %.2f rad/s\n', Wcp);
