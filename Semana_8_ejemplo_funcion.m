clc; clear; close all;

% Parámetros del sistema
tau = 50;     % Constante de tiempo (s)
K = 0.5;      % Ganancia térmica (°C/W)

% Crear la función de transferencia G(s) = K / (tau*s + 1)
num = [K];           % Numerador
den = [tau 1];       % Denominador
G = tf(num, den);
disp('Función de Transferencia G(s):');

%% escalon
figure;
step(G);
grid on;
title('Respuesta al Escalón de G(s)');
xlabel('Tiempo (s)');
ylabel('Temperatura (°C)');

%% impulso
figure;
impulse(G);
grid on;
title('Respuesta al Impulso de G(s)');
xlabel('Tiempo (s)');
ylabel('Temperatura (°C)');

%% entrada arbitraria
% Definir un vector de tiempo
t = 0:1:500;   

% Por ejemplo, una señal sinusoidal de baja frecuencia
Q_sin = 1 * sin(0.01 * t);  % Amplitud = 1 W, frecuencia = 0.01 rad/s

% Simular la respuesta
T_sin = lsim(G, Q_sin, t);

figure;
plot(t, Q_sin, 'r--', 'LineWidth', 1.5); hold on;
plot(t, T_sin, 'b', 'LineWidth', 1.5);
grid on;
title('Respuesta a Entrada Sinusoidal');
xlabel('Tiempo (s)');
ylabel('Temperatura (°C)');
legend('Entrada Q(t)','Salida T(t)');

%% frecuencia
figure;
bode(G);
grid on;
title('Diagrama de Bode de G(s)');

figure;
nyquist(G);
title('Diagrama de Nyquist de G(s)');

%% polos y ceros
p = pole(G);
z = zero(G);

disp('Polos del sistema:');
disp(p);

disp('Ceros del sistema:');
disp(z);
figure;
pzmap(G);
grid on;
title('Diagrama de Polos y Ceros de G(s)');
