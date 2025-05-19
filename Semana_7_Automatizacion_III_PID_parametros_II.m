clc; clear; close all;

% Definir el sistema de primer orden con retardo
s = tf('s');
G = 1 / (s^2 + 3*s + 2); % Función de transferencia del sistema

% Valores de PID a evaluar
P_values = [100]; % Ganancias proporcionales
I_values = [0.1, 1, 5]; % Ganancias integrales
D_values = [0, 1, 5]; % Ganancias derivativas

% Definir el tiempo de simulación
t = 0:0.01:10;

% Señal de referencia (escalón unitario)
ref = ones(size(t));



for P = P_values
    for I = I_values
        for D = D_values
            figure;
            hold on;
            grid on;
            title('Efecto de P, I, D en el controlador PID');
            % Crear el controlador PID
            C = pid(P, I, D);
            
            % Sistema en lazo cerrado
            T = feedback(C * G, 1);
            
            % Simulación de la respuesta al escalón
            [y, t_sim] = step(T, t);
            
            % Graficar la respuesta
            plot(t_sim, y, 'DisplayName', sprintf('P=%.1f, I=%.1f, D=%.1f', P, I, D));
            xlabel('Tiempo (s)');
            ylabel('Salida');
            legend;
            hold off;
        end
    end
end

