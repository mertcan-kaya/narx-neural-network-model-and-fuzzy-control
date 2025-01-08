clc, clear all, close all

load('veriler_2018');

model = readfis('model_narx.fis');

figure('Name','Input')
plot(t,u)
xlabel('time (sec)')
ylabel('input')

u1 = u(2:end-1);
u2 = u(1:end-2);
y1 = y(2:end-1);
y2 = y(1:end-2);

output1 = evalfis([u2 u1 y2 y1],model);

u1_2 = u(2:end-3);
u2_2 = u(1:end-4);
y_est1 = output1(2:end-1);
y_est2 = output1(1:end-2);
y_est0 = output1(3:end);

uy2 = [u2_2 u1_2 y_est2 y_est1 y_est0];

neuroFuzzyDesigner

