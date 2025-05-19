clc; clear; close all;

% Definir la función de transferencia del sistema estable
s = tf('s');
G = 10 / ((s + 1) * (s + 3));

% Obtener los márgenes de ganancia y fase antes del compensador
[GM, PM, Wcg, Wcp] = margin(G);
fprintf('Sistema sin compensador:\n');
fprintf('Margen de ganancia: %.2f dB\n', 20*log10(GM));
fprintf('Margen de fase: %.2f°\n\n', PM);

% Respuesta al escalón sin compensador
figure;
step(G);
title('Respuesta al escalón - Sistema sin compensador');
grid on;

%% DISEÑO DEL COMPENSADOR

% Compensador de adelanto (Lead)
alpha = 0.1;  % Factor de mejora en la fase
tau = 1 / Wcp;  % Aproximación de la constante de tiempo
C = (1 + tau*s) / (1 + alpha*tau*s); % Compensador

% Sistema compensado en lazo abierto
G_comp = C * G;

% Obtener los márgenes de ganancia y fase con el compensador
[GMc, PMc, Wcgc, Wcpc] = margin(G_comp);
fprintf('Sistema con compensador:\n');
fprintf('Margen de ganancia: %.2f dB\n', 20*log10(GMc));
fprintf('Margen de fase: %.2f°\n\n', PMc);

% Comparación de respuestas al escalón
figure;
step(G, 'b', feedback(G_comp, 1), 'r');
legend('Sin compensador', 'Con compensador');
title('Comparación de la respuesta al escalón');
grid on;

% Diagramas de Bode antes y después del compensador
figure;
bode(G, 'b', G_comp, 'r');
legend('Sin compensador', 'Con compensador');
title('Diagrama de Bode - Comparación');
grid on;
