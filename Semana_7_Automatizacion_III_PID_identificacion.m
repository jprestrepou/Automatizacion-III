t = 0:0.1:100; % Tiempo de 0 a 100 segundos con pasos de 0.1s
T = 25 + 5*sin(0.1*t) + randn(size(t)); % Señal de temperatura simulada
plot(t, T)
xlabel('Tiempo (s)')
ylabel('Temperatura (°C)')
title('Señal de Temperatura')
grid on

data = iddata(T', t', 0.1); % Crear conjunto de datos
sys = tfest(data, 1, 1); % Estima un modelo de primer orden


