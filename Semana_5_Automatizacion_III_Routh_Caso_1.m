num = [0 0 0 0 0 1];         
den = [1 2 3 6 5 3];  
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