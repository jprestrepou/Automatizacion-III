% Definir los coeficientes para cada factor lineal
a = 1;  
b = 2;

% Numerador y denominador
num = 1;
den = conv([1 a], [1 b]);  % Esto genera el polinomio (s+1)(s+2)

% Crear la función de transferencia G(s)
G = tf(num, den);

% Mostrar la función de transferencia en la consola
disp('Función de transferencia G(s):');
G

% Graficar el diagrama de Nyquist
figure;
nyquist(G);
grid on;
title('Diagrama de Nyquist de G(s) = 1/((s+1)(s+2))');

