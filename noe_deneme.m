clc, clear all, close all

load('basamak_2018')

figure('Name','Input')
plot(t,u)
xlabel('time (sec)')
ylabel('input')

figure('Name','Output Measured')
plot(t,y)
xlabel('time (sec)')
ylabel('output')

t = t';

model = readfis('model_narx.fis');

u1 = u(2:end-1);
u2 = u(1:end-2);
y1 = y(2:end-1);
y2 = y(1:end-2);

y_est_narx = evalfis([u2 u1 y2 y1],model);

e1 = u(3:end)-y(3:end);
e2 = u(3:end)-y_est_narx;

itse1 = trapz(e1.^2)*0.05;
itse2 = trapz(e2.^2)*0.05;

% figure
% plot(t(3:end),u(3:end),t(3:end),y(3:end),t(3:end),y_est_narx)

y_est_noe = zeros(size(y));
for i = 1:length(t)-2
    y_est_noe(i+2) = evalfis([u(i) u(i+1) y_est_noe(i) y_est_noe(i+1)],model);
end

figure('Name','Output NARX vs NOE')
plot(t(3:end),y_est_narx,t(3:end),y_est_noe(3:end))
xlabel('time (sec)')
ylabel('output')
legend('y NARX','y NOE')

figure('Name','Output Error NARX vs NOE')
plot(t(3:end),y(3:end)-y_est_narx,t(3:end),y(3:end)-y_est_noe(3:end))
xlabel('time (sec)')
ylabel('error')
legend('e NARX','e NOE')
