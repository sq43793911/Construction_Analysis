function dy = ReibschwingerDGL(t,y,m,d,c,vband,u,u0,reibung,a,b)
g =9.8;

% Berechnung vrel
vrel = vband - y(2);


% Reibungsarte
switch reibung
    case 1
        mu = u;
    case 2
        mu = (u0-u)/(1+a*abs(vrel))+u;
    case 3
        mu = (u0-u)/(1+a*abs(vrel))+b*abs(vrel)^2+u;
end

% Fallunterscheidung zwischen Haften und Gleiten inkl. entspr. DGL

if vrel<=0.001 && abs(d*y(2)+c*y(1)) <= u0*m*g 
        dy(1) = vband;
        dy(2) = 0;
else 
        Fr = mu*m*g*sign(vrel);
        dy(1) = y(2);
        dy(2) = (-d/m)*y(2)+(-c/m)*y(1)+Fr/m;    
end


% Transformation dy
dy = dy';

end