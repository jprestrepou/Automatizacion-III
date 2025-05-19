clc; clear; close all;

% Definir la planta: G(s)=0.5/(50*s+1)
s = tf('s');
K = 0.5;
tau = 50;
G = K/(tau*s+1);

% Mostrar la función de transferencia de la planta
disp('Función de transferencia de la planta:');
G

% Sintonización del controlador PID utilizando pidtune
% El segundo argumento 'PID' indica que deseamos un controlador PID.
C = pidtune(G, 'P');

% Mostrar el controlador sintonizado
disp('Controlador PID sintonizado con pidtune:');
C

% Construir el sistema en lazo cerrado
T_closed = feedback(C * G, 1);

% Simulación de la respuesta al escalón del sistema en lazo cerrado
t = 0:0.1:500;
figure;
step(37*T_closed, t);
grid on;
title('Respuesta al Escalón con PID sintonizado');
xlabel('Tiempo (s)');
ylabel('Salida (°C)');

% Opcional: Mostrar diagrama de polos y ceros del sistema controlado
figure;
pzmap(T_closed);
grid on;
title('Diagrama de Polos y Ceros del Sistema con PID');

% Opcional: Graficar el diagrama de Bode del sistema en lazo cerrado
figure;
bode(T_closed);
grid on;
title('Diagrama de Bode del Sistema en Lazo Cerrado');
