num = [0 0 0 0 0 1];         
den = [1 1 4 24 3 63];  
%estrouth(num,den,1)

num = [1];   
rlocus(num,den)
hold on
v = [-6 6 -6 6]; 
axis(v);
title('Gráfica del lugar de las raíces')

H = tf(num,den);
figure;
step(H);
title('Sistema Estable - Respuesta al Escalón');
grid on;