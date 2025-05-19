clc; 
clear; 
close all;

num = [1];       
den = [1 4 3];   % s^2 + 4s + 3
H = tf(num, den);

poles = pole(H);
disp('Polos del sistema:')
disp(poles)

figure;
pzmap(H);
title('Sistema Estable - Diagrama de Polos y Ceros');
grid on;

figure;
step(H);
title('Sistema Estable - Respuesta al Escalón');
grid on;
