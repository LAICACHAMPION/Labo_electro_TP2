clc;
clearvars;
clear all;

M = csvread('tp2_ej4_c_c.csv');

f = M(:,1)*10000;
Vin = M(:,2);
Vout = M(:,3);
relacion = Vout /Vin;
dB = 20*log(relacion);

fase = M(:,4);

fig_mod =figure;
modulo_plot = plot(f, dB);
ax = gca;
ax.XScale = 'log';
ax.XLim = [ax.XLim(1)*10 ax.XLim(2)];
ax.Title.String = 'Respuesta en Frecuencia - M�dulo';
ax.XLabel.String = 'Frecuencia (Hz)';
ax.YLabel.String = 'Magnitud (dB)';

figure;
fase_plot = plot(f, wrapTo180(fase));
ax = gca
ax.XLim = [ax.XLim(1)*10000 ax.XLim(2)];
ax.XScale = 'log';
ax.Title.String = 'Respuesta en Frecuencia - Fase';
ax.XLabel.String = 'Frecuencia (Hz)';
ax.YLabel.String = 'Fase (grados)';


s = tf('s');
C = 12e-9;
L = 1000e-6;
R = 120;
H = (s^2*L*C)/(s^2*L*C + s*C*R+1);

figure;
bode(H)


