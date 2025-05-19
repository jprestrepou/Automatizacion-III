clc; clear; close all;

% Definir la función de transferencia del sistema
s = tf('s');
G = 10 / (s * (s + 2));

% Graficar el diagrama de Bode del sistema sin compensación
figure;
bode(G);
margin(G);
grid on;
title('Diagrama de Bode del Sistema sin Compensador');

% Obtener los márgenes de ganancia y fase actuales
[GM, PM, Wcg, Wcp] = margin(G);
fprintf('Margen de ganancia: %.2f dB\n', 20*log10(GM));
fprintf('Margen de fase: %.2f°\n', PM);

% Diseño del compensador de adelanto
% Elegimos un margen de fase deseado de al menos 45°
phi_d = 50 - PM; % Aumentar la fase en phi_d grados
alpha = (1 - sind(phi_d)) / (1 + sind(phi_d)); % Relación entre cero y polo
wc_d = Wcp; % Se elige la frecuencia de cruce como la misma

% Definir el compensador de adelanto
T = 1 / (sqrt(alpha) * wc_d); % Constante de tiempo
Gc = (1 + T * s) / (1 + alpha * T * s);

% Sistema compensado
G_new = Gc * G;

% Graficar el diagrama de Bode con el compensador
figure;
bode(G, G_new);
margin(G_new);
grid on;
legend('Sistema original', 'Sistema compensado');
title('Diagrama de Bode con Compensador de Adelanto');

% Obtener los nuevos márgenes de ganancia y fase
[GM_new, PM_new, ~, ~] = margin(G_new);
fprintf('Nuevo margen de ganancia: %.2f dB\n', 20*log10(GM_new));
fprintf('Nuevo margen de fase: %.2f°\n', PM_new);
