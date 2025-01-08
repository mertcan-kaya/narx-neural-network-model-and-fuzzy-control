
clc;
clear all;

load('basamak_2018')

figure('Name','Input')
plot(t,u)
xlabel('time (sec)')
ylabel('input')

model_narx = readfis('model_narx.fis');
model_noe = readfis('model_noe.fis');

u1 = u(2:end-1);
u2 = u(1:end-2);
y1 = y(2:end-1);
y2 = y(1:end-2);

output1 = evalfis([u2 u1 y2 y1],model_narx);
output2 = evalfis([u2 u1 y2 y1],model_noe);

plot(t(1:end-2),output1,t(1:end-2),output2)
legend('narx','noe');

xlabel('time (sec)');
ylabel('output');