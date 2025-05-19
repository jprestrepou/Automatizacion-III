clc; clear; close all;

% Definir el sistema
s = tf('s');
G = 1 / (s^2 + 3*s + 2);  % Función de transferencia de segundo orden

% Definir la frecuencia de cruce deseada
w_c = 5; 

% Sintetizar el PID con la frecuencia de cruce personalizada
C = pidtune(G, 'PID', w_c);

% Mostrar los parámetros ajustados
disp('Parámetros del PID sintonizado:');
disp(C);

% Simulación en lazo cerrado
T = feedback(C * G, 1);
t = 0:0.01:10;
[y, t] = step(T, t);

% Gráfica de la respuesta
figure;
plot(t, y, 'b', 'LineWidth', 2);
grid on;
xlabel('Tiempo (s)');
ylabel('Salida');
title('Respuesta con PID Sintonizado a Tiempo de Estabilización de 2s');
legend('Salida del sistema');

figure;
step(T, t);