clc; 
clear; 
close all;

wn = 5; 
zeta_values = [0.1, 1, 1.5, 0]; 
titles = {'Subamortiguado (\zeta = 0.5)', 'Críticamente Amortiguado (\zeta = 1)', ...
          'Sobreamortiguado (\zeta = 1.5)', 'No Amortiguado (\zeta = 0)'};

figure();

for i = 1:length(zeta_values)
    zeta = zeta_values(i);
    
    num = [wn^2]; 
    den = [1, 2*zeta*wn, wn^2];
    H = tf(num, den);
    poles = pole(H);
    routh = rlocus(num,den);

    subplot(2,2,i);
    step(H);
    title(titles{i});
    grid on;

    disp(['Sistema: ', titles{i}]);
    disp('Polos:');
    disp(poles);
    disp('---------------------------');  
    disp('Matriz de Routh:');
    disp(routh);
    disp('---------------------------'); 
    disp('---------------------------'); 
end

figure();
for i = 1:length(zeta_values)
    zeta = zeta_values(i);
    
    num = [wn^2]; 
    den = [1, 2*zeta*wn, wn^2];
    H = tf(num, den);
    poles = pole(H);

    figure();
    pzmap(H);
    title(['Ubicación de Polos - ',titles{i}]);
    grid on;
end
