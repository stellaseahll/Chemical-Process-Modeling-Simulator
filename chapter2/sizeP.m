function [size,Re,Cd]=sizeP(denF,denP,terV,vis,phi)
%sizeP Evaluates the size of a particle
%   size= sizeP(DENF,DENP,TERV,VISC,PHI) evaluates the size of a single 
%   particle that falls freely under gravity in a fluid for a given terminal
%   velocity. DENF is the fluid density, DENP is the particle density, TERV
%   is the terminal velocity, VISC is the viscosity and PHI is the 
%   sphericity of the particle.
%
%   size= sizeP(DENF,DENP,TERV,VISC,PHI) evaluates the particle size when
%   sphericity is equal to 1.
%
%   [size Re]= sizeP(DENF,DENP,TERV,VISC,PHI) returns both the particle 
%   size and the Reynolds number Re at terminal velocity.
%
%   [size Re Cd]= sizeP(DENF,DENP,TERV,VISC,PHI) returns the particle size,
%   Reynolds number Re and drag coefficient Cd at terminal velocity.
%

% NOTE [double double]=sizeP(double, double ,double ,double ,double)
if (nargin==4)
    phi=1;
end

K=4*(denP-denF)*9.81*vis/terV^3/3/denF^2;
if (nargout==0)
    plotDragForce;
    hold on;
    Re=logspace(-3,5,1000);
    Cd=K.*Re;
    Cd(Cd>10^4)=NaN;
    Cd(Cd<0.1)=NaN;
    loglog(Re,Cd,'k','linewidth',0.5);
    return;
end
Re=computeRe(phi,K);
size=Re*vis/denF/terV;
if (nargout==3)
    Cd=Re*K;
end
end

function Re=computeRe(phi,K)
k=correlationDrag;
k(:,6)=k(:,6)-1;
k(:,7)=k(:,7)-log10(K);
switch phi
    case 1
        x=1;
    case 0.806
        x=2;
    case 0.6
        x=3;
    case 0.22
        x=4;
    case 0.125
        x=5;
    otherwise
        x=0;
end

if (x~=0)
    r=roots(k(x,:));
    for i=1:length(r)
        if (isreal(r(i))&&real(r(i))>-4&&real(r(i))<5.5)
            Re=10^r(i);
            return;
        end
    end
end
R=zeros(1,5);
for i=1:5
    r=roots(k(i,:));
    for j=1:length(r)
        if (isreal(r(j))&&real(r(j))>-4&&real(r(j))<5.5)
            R(i)=10^r(j);
        end
    end
end

p=[1 0.806 0.6 0.22 0.125];
c=polyfit(p,R,3);
Re=c(1)*phi^3+c(2)*phi^2+c(3)*phi+c(4);
end