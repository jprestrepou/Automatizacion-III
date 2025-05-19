clc; clear; close all;

% Definir la función de transferencia del sistema
s = tf('s');
G = 1 / (s + 1);

% Sintetizar un controlador PID automáticamente
C = pidtune(G, 'PID');

% Mostrar los parámetros obtenidos
disp('Parámetros del PID sintonizado:');
disp(C);

% Sistema en lazo cerrado con el PID ajustado
T = feedback(C * G, 1);

% Simulación de la respuesta al escalón
t = 0:0.01:5;  
[y, t] = step(T, t);

% Gráfica de la respuesta del sistema con el PID ajustado
figure;
plot(t, y, 'b', 'LineWidth', 2);
grid on;
xlabel('Tiempo (s)');
ylabel('Salida');
title('Respuesta del Sistema con PID sintonizado');
legend('Salida del sistema');

% Graficar los polos
figure;
pzmap(T);
grid on;
title('Diagrama de Polos y Ceros');
