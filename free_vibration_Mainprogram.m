% Testlösung für das Thema Lineares/nichtlineares Systemverhalten
%

%close all;
clear all;

%% Aufgabe 1 freie, ungedämpfte Schwingung
% Definition aller Parameter
m = 1; % Masse kg
D = 0.05; % Dämpfer N*s/m
c = 1; % Feder N/m

%Anfangsbedingungen
y0 = 2;
y0punkt = 0;

%
d = 2*D*(c*m)^0.5;

% Zeit s
tstart = 0;
dt = 0.1;
tend = 100;

zeit = tstart : dt : tend;

% Ploteinstellung
FontSize = 16;
LineWidth = 1.5;


% Lösen der DGL/Aufruf der ODE Funktion
[T, Y] = ode45(@(t,y) Schwingungsgleichung_frei(t,y,m,d,c), zeit, [y0 y0punkt]);
    

% Plot Zeitverlauf Weg und Geschwindigkeit
figure(1)

plot (T, Y(:,1),'b', 'LineWidth',LineWidth); % plot Weg
xlabel('Simulationszeit in s')


hold on

plot(T,Y(:,2),'r','LineWidth',LineWidth); % plot Gwschwindigkeit
legend('Weg', 'Geschwindigkeit')
title('Zeitverlauf Weg und Geschwindigkeit')


grid on

% Plot Geschwindigkeit-Weg-Diagramm
figure(2)
plot(Y(:,1),Y(:,2),'LineWidth',LineWidth);
xlabel('Weg in mm')
ylabel('Geschwindigkeit in mm/s')
title('Geschwindigkeit-Weg-Diagramm')
grid on

