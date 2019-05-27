%% Maxwell Ast

clear all;

%%

E = 750; % Mpa
eta = 0.5; %Mpas

% Zeit [ms]
Tstart = 0;
Tend = 5;
dt = 0.1;

T = Tstart:dt:Tend;
aa = length (T);

for i = 1:aa
    if T(i)<1
        eps(i) = 0;
    elseif T(i)>=1 && T(i)<=3
        eps(i) = 2;
    else
        eps(i) = 0;
    end
end


figure(1)
plot(T,eps,'b');
grid on;
xlabel('Simulationszeit in ms');
ylabel('Dehnung in %');
title('vorgegebene Dehnung');
axis([Tstart Tend 0 3]);

 
epsdot = zeros(1,aa);
for j = 1:aa
    if j == 1
        epsdot(j) = (eps(j+1)-eps(j))/dt;
    elseif j>1 && j<aa
        epsdot(j) = (eps(j+1)-eps(j-1))/(2*dt);
    else
        epsdot(j) = (eps(j)-eps(j-1))/dt;
    end
end

epsdotmin = min(epsdot);
epsdotmax = max(epsdot);
ymin = epsdotmin - 1/dt;
ymax = epsdotmax + 1/dt;

figure(2)
plot(T,epsdot,'r')
xlabel('Simulationszeit in ms')
ylabel('Dehnungrate in %/ms')
title('Berechnete Dehnrate')
axis([Tstart Tend ymin ymax]);
grid on

Tspan = T/1000;
tepsilondot = Tspan;
epsilondot = epsdot*10;

IC = 0;

options=odeset('MaxStep',1e-4); % Anpassen der maximalen Schrittweite
[t, Sigma1] = ode23(@(t,sigma) DGLMaxwell(t,sigma,E,eta,tepsilondot,epsilondot),Tspan,IC,options);

for x = 1:aa
    Sigma0(x) = E*(eps(x)/100);
    Sigma(x) = Sigma1(x) + Sigma0(x);
end


    

figure(3)
hold on
plot(t,Sigma,'r')

plot(t,Sigma0,'b')

plot(t,Sigma1,'g')

xlabel('Simulationszeit in s')
ylabel('Spannung in Mpa')
title('Berechnete Spannung')
legend('Sigma', 'Sigma 0','Sigma 1')
grid on

figure(4)
plot(t,Sigma1,'g')
xlabel('Simulationszeit in s')
ylabel('Spannung 1 in Mpa')
title('Berechnete Spannung')
grid on
% [T, Sigma1] = ode23(@(t,sigma) DGLMaxwell_no_parameters(t,sigma),T,IC,options); 




 
 
 