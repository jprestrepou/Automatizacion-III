clc; clear; close all;

% Función de transferencia con polos en el eje imaginario
num = [1];
den = [1 0 4];  % s^2 + 4 = 0

H = tf(num, den);

% Mostrar polos
poles = pole(H);
disp('Polos del sistema:')
disp(poles)

% Graficar polos
figure;
pzmap(H);
title('Sistema Marginalmente Estable - Diagrama de Polos y Ceros');
grid on;

% Respuesta al escalón
figure;
step(H);
title('Sistema Marginalmente Estable - Respuesta al Escalón');
grid on;