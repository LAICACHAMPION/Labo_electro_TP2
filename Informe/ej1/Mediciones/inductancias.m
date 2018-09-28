clc;
clearvars;
clear all;
M = csvread('inductancias.csv')

f = M(:,1);
L = M(:,2);
Q = M(:,3);
R = M(:,4);
% fase = M(:,5);
% 
% 
% figure;
% plot(f,L)
% 
% figure;
% plot(f,Q)
% 
% figure;
% plot(f,R)
% figure;
% plot(f,fase)
plot(2*pi*f*1000, 10*log((f).^2.*L.^2+R.^2));		%las frecuencias las tengo en kHz!!! acomode. No se que onda la amplitud
C = 1e-11;
L = 7.72e-4;
R = 286;
s = tf('s');
H = (s*C+1/(R+s*L))^(-1);
figure;
bode(H)



