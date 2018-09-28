clc;
clearvars;
clear all;
M = csvread('Capacitancia.csv')

f = M(:,1);
C = M(:,2);
G = M(:,3);

figure;
plot(f,C);
figure;
plot(f,G);


