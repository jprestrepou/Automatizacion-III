clc; clear; close all;

% Parámetros de la planta
tau = 50; 
K = 0.5; 

% Definir la función de transferencia G(s) = K / (tau*s + 1)
s = tf('s');
G = K / (tau*s + 1);

% Controlador PID (ejemplo)
Kp = -1;
Ki = -1;
Kd = -1;
PID = Kp + Ki/s + Kd*s;

% Función de transferencia en lazo cerrado
T_closed = feedback(PID * G, 1);

% Simulación de la respuesta al escalón de 37°C
t = 0:1:500;
figure;
step(37 * T_closed, t);  % paso de magnitud 37
grid on;
title('Respuesta en lazo cerrado con Control PID');
xlabel('Tiempo (s)');
ylabel('Temperatura (°C)');

% Respuesta sin control
T_open = feedback(G, 1); % Realmente es G/(1+G) (control unitario)
figure;
step(37 * T_open, t);
grid on;
title('Respuesta en lazo cerrado sin controlador');
xlabel('Tiempo (s)');
ylabel('Temperatura (°C)');
