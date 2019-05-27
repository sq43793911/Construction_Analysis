%% Settings
clear all
close all
clc


% Eingangsdaten Reibschwinger
m = 1; %kg
D = 0.05; %
c = 1; %n/m
vband = +2; %m/s
u = 0.3;
u0 = 0.45; 
d = 2*D*(c*m)^0.5; %D�mfung kg/s

% Simulatiionszeit und Anfangswerte
Tstart = 0;
Tend = 100;
dt = 0.1;
T = Tstart:dt:Tend;

aa = length(T);

y0 = 0;
doty0 = vband;

%% Reibungsarte
reibung = 3;
% reibung = 1, Coulomb
% reibung = 2, Fallender Reibwert
% reibung = 3, Stribeck Kurve

a = 5;
b = 1e-3;

%% DGL l�sen
% Aufruf DGL
options = odeset('RelTol',1e-10,'AbsTol',1e-12);
[T, Y] = ode45(@(t,y) ReibschwingerDGL(t,y,m,d,c,vband,u,u0,reibung,a,b), T, [y0 doty0],options);


%% Plot options
FontSize = 18;
LineWidth = 1.5;


%% Plot Weg-Zeit und Gewschindigkeit-Zeit
figure(1)
plot(T,Y(:,1),'b','LineWidth',LineWidth)
hold on
plot(T,Y(:,2),'r','LineWidth',LineWidth)
legend('Weg', 'Geschwindigkeit')
xlabel('Simulationszeit in s')
ylabel('Amplitude')
title('Weg-Zeit und Gewschindigkeit-Zeit')
grid on


%% Plot Geschwindgikeit-Weg
figure(2)
plot(Y(:,1),Y(:,2),'LineWidth',LineWidth)
xlabel('Weg')
ylabel('Geschwindigkeit')
title('Geschwindgikeit-Weg')
hold on
plot(Y(1,1),Y(1,2),'ro','LineWidth',LineWidth)
text(Y(1,1),Y(1,2),' Start','color','red','FontSize',FontSize)
%text(Y(aa,1),Y(aa,2),'End','color','red','FontSize',FontSize)
grid on
