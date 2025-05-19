clc; clear; close all;

% Función de transferencia con un polo en el semiplano derecho
num = [1];
den = [1 -3 2];  % s^2 - 3s + 2

H = tf(num, den);

% Mostrar polos
poles = pole(H);
disp('Polos del sistema:')
disp(poles)

% Graficar polos
figure;
pzmap(H);
title('Sistema Inestable - Diagrama de Polos y Ceros');
grid on;

% Respuesta al escalón
figure;
step(H);
title('Sistema Inestable - Respuesta al Escalón');
grid on;
