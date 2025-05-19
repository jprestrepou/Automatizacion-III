clc; clear; close all;

%% Parámetros críticos obtenidos experimentalmente
Ku = 22;    % Ganancia crítica
Tu = 120;   % Período crítico (s)

%% Cálculo de los parámetros PID según Ziegler-Nichols
Kp = 0.6 * Ku;
Ti = 0.5 * Tu;
Td = 0.125 * Tu;

% Para implementar el PID en forma clásica:
Ki = Kp / Ti;   % Acción integral
Kd = Kp * Td;   % Acción derivativa

fprintf('Sintonización PID Ziegler-Nichols:\n');
fprintf('Kp = %.2f\n', Kp);
fprintf('Ki = %.4f\n', Ki);
fprintf('Kd = %.2f\n', Kd);

%% Definir la función de transferencia de la planta
% Ejemplo: G(s) = 0.5 / (50*s + 1)
K = 0.5;
tau = 50;
s = tf('s');
G = K / (tau*s + 1);

%% Definir el controlador PID
% C(s) = Kp + Ki/s + Kd*s
PID = Kp + Ki/s + Kd*s;

%% Sistema en lazo cerrado
T_closed = feedback(PID * G, 1);

%% Simulación de la respuesta al escalón
t = 0:1:500;
figure;
step(T_closed, t);
grid on;
title('Respuesta al Escalón con Control PID (Ziegler-Nichols)');
xlabel('Tiempo (s)');
ylabel('Salida (T)');

%% (Opcional) Graficar diagrama de polos y ceros
figure;
pzmap(PID*G);
grid on;
title('Diagrama de Polos y Ceros del Sistema con PID');
