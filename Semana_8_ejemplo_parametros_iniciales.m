clc; clear; close all;

%% Definir la planta
% Usamos la función de transferencia:
% G(s) = 1/(s*(s+1))
s = tf('s');
G = 1/(s*(s+1)+1);

%% Búsqueda numérica de Ku y Tu
% Se varía Kp (controlador proporcional) y se analiza el sistema en lazo cerrado
% Buscamos el valor de Kp para el cual aparece un par de polos con parte real cercana a 0 (oscilación sostenida)
Kp_range = linspace(1,5,30);
Ku = NaN;
Tu = NaN;

for Kp = Kp_range
    % Sistema en lazo cerrado con controlador proporcional puro
    T_closed = feedback(Kp*G, 1);
    
    % Obtener los polos del sistema
    p = pole(T_closed);

    t = 0:0.1:50;
    figure;
    step(T_closed, t);
    grid on;
    title(sprintf('Respuesta al Escalón con K_p = Ku = %.2f', Ku));
    xlabel('Tiempo (s)');
    ylabel('Salida');
    
end
