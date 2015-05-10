function [Re Cd]=Reynolds(denF,velP,size,visc,phi)
%Reynolds Evaluates the Reynolds number and drag coefficient
%   Re= Reynolds(DENF,VELP,SIZE,VISC,PHI) evaluates the Reynolds number
%   of a particle that falls freely under gravity in a fluid. DENF is the
%   fluid density, VELP is the particle velocity, SIZE is the particle size,
%   VISC is the viscosity and PHI is the sphericity of the particle.
%
%   Re= Reynolds(DENF,DENP,SIZE,VISC,PHI) evaluates the Reynolds number
%   when sphericity is equal to 1.
%
%   [Re Cd]= Reynolds(DENF,DENP,SIZE,VISC,PHI) returns both the Reynolds
%   number and drag coefficient.

% NOTE [double double]=terminalV(double, double ,double ,double ,double)

    Re=denF*velP*size/visc;
    if (nargin==4)
        phi=1;
    end
    if (nargout==2)
        Cd=calcDrag(Re,phi);
    end
end

function Cd=calcDrag(Re,phi)
k=correlationDrag();
X=log10(Re);
if (phi==1)
    if (Re>0.01)
        logCd=k(1,1)*X.^6+k(1,2)*X.^5+k(1,3)*X.^4+k(1,4)*X.^3+k(1,5)*X.^2+k(1,6)*X.^1+k(1,7);
        Cd=10.^logCd;
    else
        logCd=-0.9819*X+1.4310;
        Cd=10.^logCd;
    end
    return;
elseif (phi==0.806)
    if (Re>0.01)
        logCd=k(2,1)*X.^6+k(2,2)*X.^5+k(2,3)*X.^4+k(2,4)*X.^3+k(2,5)*X.^2+k(2,6)*X.^1+k(2,7);
        Cd=10.^logCd;
    else
        logCd=-0.9198*X+1.677;
        Cd=10.^logCd;
    end
    return;
elseif (phi==0.6)
    if (Re>0.001)
        logCd=k(3,1)*X.^6+k(3,2)*X.^5+k(3,3)*X.^4+k(3,4)*X.^3+k(3,5)*X.^2+k(3,6)*X.^1+k(3,7);
        Cd=10.^logCd;
    else
        logCd=-0.9549*X+1.6946;
        Cd=10.^logCd;
    end
    return;
elseif (phi==0.22)
    if (Re>0.01)
        logCd=k(4,1)*X.^6+k(4,2)*X.^5+k(4,3)*X.^4+k(4,4)*X.^3+k(4,5)*X.^2+k(4,6)*X.^1+k(4,7);
        Cd=10.^logCd;
    else
        logCd=-0.9771*X+1.7154;
        Cd=10.^logCd;
    end
    return;
elseif (phi==0.125)
    if (Re>0.01)
        logCd=k(5,1)*X.^6+k(5,2)*X.^5+k(5,3)*X.^4+k(5,4)*X.^3+k(5,5)*X.^2+k(5,6)*X.^1+k(5,7);
        Cd=10.^logCd;
    else
        logCd=-0.9153*X+1.8996;
        Cd=10.^logCd;
    end
else
    if (Re>0.01)
        x=X*ones(7,1);
        power=(6:-1:0)';
        x=x.^power;
        logCd=k*x;
        ph=[1;0.806;0.6;0.22;0.125];
        co=polyfit(ph,logCd,3);
        logCd=co(1)*phi^3+co(2)*phi^2+co(3)*phi+co(4);
        Cd=10.^logCd;
    else
        logCd(1)=-0.9819*X+1.4310;
        logCd(2)=-0.9198*X+1.677;
        logCd(3)=-0.9549*X+1.6946;
        logCd(4)=-0.9771*X+1.7154;
        logCd(5)=-0.9153*X+1.8996;
        ph=[1;0.806;0.6;0.22;0.125];
        co=polyfit(ph,logCd,3);
        logCd=co(1)*phi^3+co(2)*phi^2+co(3)*phi+co(4);
        Cd=10.^logCd;
    end 
end
end
    
    


