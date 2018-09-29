clear all;
clc;
clearvars;

syms s 
syms C R L
syms t

 H = (s*C*R)/(s^2*L*C+s*R*C+1);

% H = (s^2*L*C + 1)/(s^2*L*C+s*R*C+1);

% H = (s^2*L*C)/(s^2*L*C+s*R*C+1);
H = H/s;
h = ilaplace(H)


clc;
clearvars;
t = 0:1e-8:1.6e-4;
% syms t
R= 120;
L = 1000e-6;
C = 12e-9;
% hfinal = (2*C^(1/2)*R*sin((t.*(- C*R^2 + 4*L).^(1/2))/(2*C^(1/2)*L)).*exp(-(R.*t)/(2*L)))/(4*L - C*R^2).^(1/2);

% hfinal = 1 - (2*C^(1/2)*R.*sin((t.*(- C.*R^2 + 4.*L)^(1/2))/(2.*C^(1/2).*L)).*exp(-(R.*t)/(2.*L)))/(4.*L - C.*R^2).^(1/2);
hfinal = exp(-(R.*t)/(2.*L)).*(cosh((t.*((C.*R^2)/4 - L)^(1/2))/(C^(1/2).*L)) - (C^(1/2)*R*sinh((t.*((C*R^2)/4 - L)^(1/2))/(C^(1/2)*L)))/(2*((C*R^2)/4 - L)^(1/2)));
plot(t,hfinal)


% hderivada = diff(hfinal,t);
% hderivada = simplify(hderivada)
% solve(hderivada==0,t)

% solve(hfinal == 0,t)
