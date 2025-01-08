clc;
clear all;

load('veriler_2018');

figure
plot(t,u)

figure
plot(t,y)

y0=y(3:end);
u1=u(2:end-1);
y1=y(2:end-1);
u2=u(1:end-2);
y2=y(1:end-2);

uy=[u2, u1, y2, y1, y0];

% y0=y(2:end);
% u1=u(1:end-1);
% y1=y(1:end-1);
% 
% uy=[u1, y1, y0];

%  neuroFuzzyDesigner

