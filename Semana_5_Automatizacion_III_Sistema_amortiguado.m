clc; clear; close all;

% Definir el polinomio característico
num = [1];          % Numerador del sistema
den = [1 3 3 2 1];  % Denominador del sistema

% Crear la función de transferencia
sys = tf(num, den);

% Calcular los polos del sistema
poles = roots(den);
disp('Los polos del sistema son:')
disp(poles)

% ----- Graficar los polos en el plano complejo -----
figure;
pzmap(sys); % Diagrama de polos y ceros
grid on;
title('Diagrama de Polos y Ceros');

% ----- Respuesta al escalón -----
figure;
step(sys); % Respuesta al escalón
grid on;
title('Respuesta del sistema al escalón');
xlabel('Tiempo (s)');
ylabel('Amplitud');