% Definición de parámetros
K = 1;
a = 1;
b = 5;

% Definir el numerador y denominador
num = K;                   % Numerador
den = conv([1 a], [1 b]);   % Denominador de G(s) = (s+a)(s+b)

% Crear la función de transferencia
G = tf(num, den);

% Mostrar la función de transferencia en la consola
disp('Función de transferencia G(s):');
G
% Graficar el diagrama de Bode
figure;
bode(G);
grid on;
title('Diagrama de Bode de G(s)');

% Extraer los datos del diagrama de Bode
[mag, phase, w] = bode(G);

% Los datos vienen con dimensiones adicionales. Se "aplanan" los vectores con squeeze.
mag   = squeeze(mag);
phase = squeeze(phase);
w     = squeeze(w);

% Mostrar algunos valores de las variables extraídas
disp('Frecuencias (rad/s):');
disp(w(1:5));  % Muestra los primeros 5 valores

disp('Magnitud (lineal):');
disp(mag(1:5));  % Muestra los primeros 5 valores

disp('Fase (grados):');
disp(phase(1:5));  % Muestra los primeros 5 valores

% Graficar manualmente la magnitud y la fase

% Magnitud en dB
magdB = 20*log10(mag);

figure;

% Subgráfico para la magnitud
subplot(2,1,1);
semilogx(w, magdB, 'LineWidth', 1.5);
grid on;
xlabel('Frecuencia (rad/s)');
ylabel('Magnitud (dB)');
title('Diagrama de Magnitud');

% Subgráfico para la fase
subplot(2,1,2);
semilogx(w, phase, 'LineWidth', 1.5);
grid on;
xlabel('Frecuencia (rad/s)');
ylabel('Fase (°)');
title('Diagrama de Fase');
