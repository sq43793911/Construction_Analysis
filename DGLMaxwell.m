function sigmadot = DGLMaxwell(t,sigma,E,eta,tepsilondot,epsilondot)
% Differntialgleichung eines Maxwell-Astes vorbereitet f�r die L�sung mit
% einer ODE-Funktion. Es wird die Gleichung dydt = -E./eta.*y + E.*epsilondot berechnet. 
% Die Werte f�r E, eta werden fest �bergeben und epsilondot wird  f�r den aktuellen 
% Zeitpunkt der L�sung der DGL linear zwischen Eingabezeitpunkten interpoliert. 
%
% sigmadot = DGLMaxwell(t,sigma,E,eta,tepsilondot,epsilondot)
%   sigmadot = Ableitung der Spannung Sigma_1_dot
%   t        = Simulationszeitpunkt
%   sigma    = Spannung Sigma_1
%   E        = E-Modul
%   eta     = Dämpfung eta 
%   tepsilondot   = Vektor der Zeitpunkte f�r die �bergabe der zeitabh�ngigen Dehnrate epsilondot
%   epsilondot    = Vektor der Dehnrate epsilondot f�r die �bergabe an die DGL. Der Vektor muss genauso viele Elemente, wie der Vektor tepsilondot besitzen.
%
% Beispielverwendung:
%   tepsilondot = t; % Erstellung t f�r epsilondot
% 
%   Tspan = t; % Zeitpunkte an denen die Berechnung erfolgen soll
%   IC = 0; % Anfangsbedingung f�r Sigma1
%
%   L�sen der Differentialgleichung
%   options=odeset('MaxStep',1e-4); % Anpassen der maximalen Schrittweite
%   [T, Sigma1] = ode23(@(t,sigma) DGLMaxwell(t,sigma,E,eta,tepsilondot,epsilondot),Tspan,IC,options); 
% 
% TU Bergakademie Freiberg - IMKF
% Thomas Falke, auf Basis von Christian Berndt
% 07.05.2018
 
%% Interpolation der Eingabewerte f�r den aktuellen Zeitschritt
% Interpolieren des Datensatzes von epsilon (tepsilondot,epsilondot) zur Zeit t mittels 'interp1'
epsilondot = interp1(tepsilondot,epsilondot,t);
%% DGL
% cc = length(epsdot);
% sigmadot = zeros(1,cc);
% sigma = zeros(1,cc);


sigmadot = (-E./eta).*sigma + E.*epsilondot; 
sigmadot = sigmadot';

end

