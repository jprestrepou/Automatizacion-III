num = [0 0 0 0 1];         
den = [1 3 3 2 1];  
estrouth(num,den,0)

rlocus(num,den)
hold on
v = [-6 6 -6 6]; 
axis(v);
title('Gráfica del lugar de las raíces')

H = tf([1], den)
figure;
step(H);