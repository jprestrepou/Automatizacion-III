clc; clear; close all;

% Definir la función de transferencia del sistema
s = tf('s');
G = 1 / (s + 1);

% Parámetros del PID
Kp = 1.4316;
Ki = 2.5948;
Kd = 0;

% Controlador PID
C = Kp + Ki/s + Kd*s;

% Sistema en lazo cerrado
T = feedback(C * G, 1);

% Polos del sistema en lazo cerrado
poles = pole(T);

% Mostrar los polos
disp('Polos del sistema en lazo cerrado:');
disp(poles);

% Graficar polos en el plano complejo
figure;
pzmap(T);
grid on;
title('Diagrama de Polos y Ceros');

% Simulación de la respuesta al escalón
t = 0:0.01:5;  % Tiempo de simulación
[y, t] = step(T, t);

% Gráfica de la respuesta del sistema
figure;
plot(t, y, 'b', 'LineWidth', 2);
grid on;
xlabel('Tiempo (s)');
ylabel('Salida');
title('Respuesta del Sistema con Control PID');
legend('Salida del sistema');

figure;
step(T, t);
