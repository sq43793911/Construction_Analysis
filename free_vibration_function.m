function [dy] = Schwingungsgleichung_frei(t,y,m,d,c)
% Differntialgleichung eines freien Einmassenschwingers vorbereitet f�r die L�sung mit
% einer ODE-Funktion. Es wird die Gleichung d2x + d/m*d1x c/m*x = 0 berechnet. 
% Die Gleichung wird in ein Gleichungsssystem 1. Ordnung �berf�hrt.
%
% [dy] = Schwingungsgleichung_frei(t,y,m,d,c)
%   dy       = Ergebnismatrix mit Weg und Geschwindigkeit als Spalte
%   t        = Simulationszeitpunkt
%   y        = y Eingabematrix mit Weg und Geschwindigkeit als Spalte
%   m        = Masse m
%   d        = D�mpfung d
%   c        = Federsteifigkeit c
%
% zeit = Zeitpunkte an denen ein Ergebniss generiert werden soll
% [y0 y0punkt] = Anfangswerte f�r Weg y und Geschwindgiet d1y
% 
% % L�sen der Bewegungsgleichung
% [T, Y] = ode45(@(t,y) Schwingungsgleichung_frei(t,y,m,d,c), zeit, [y0 y0punkt]);
% 
% TU Bergakademie Freiberg - IMKF
% Thomas Falke, Christian Berndt
% 29.05.2018
%
%
% Diese Funktion muss folgendes beinhalten:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Umrechnung von d und c zu a und b (empfohlen)

% DGL-System 1. Ordnung

a = c/m;
b = d/m;


dy(1) = y(2);
dy(2) = -b*y(2)-a*y(1);

dy = dy';
end

