function [size Re Cd]=calcSize(denF,denP,vel,vis,phi)
%calcSize Evaluates the terminal velocity 
%   size= calcSize(DENF,DENP,VEL,VISC,PHI) evaluates the size of a particle
%   that falls freely under gravity in a fluid. DENF is the fluid density, 
%   DENP is the particle density, SIZE is the particle size, VISC is the 
%   viscosity and PHI is the sphericity of the particle.
%
%   size= calcSize(DENF,DENP,VEL,VISC) evaluates the size of a particle
%   when sphericity is equal to 1.
%
%   [size Re]= calcSize(DENF,DENP,VEL,VISC,PHI) returns both the size of a 
%   particle and the Reynolds number Re at terminal velocity.
%
%   [size Re Cd]= calcSize(DENF,DENP,VEL,VISC,PHI) returns the size of a 
%   particle Reynolds number Re and drag coefficient Cd at terminal velocity.


% NOTE [double double]=calcTermV(double, double ,double ,double ,double)

if (nargin==4)
    phi=1;
end
K=4*9.81*vis*(denP-denF)/3/vel^3/denF^2;
Re=computeRe(phi,K);
Cd=K*Re;
size=Re*vis/denF/vel;
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
        if (isreal(r(i))&&real(r(i))>-4&&real(r(i))<5)
            Re=10^r(i);
            return;
        end
    end
end
R=zeros(1,5);
for i=1:5
    r=roots(k(i,:));
    for j=1:length(r)
        if (isreal(r(j))&&real(r(j))>-4&&real(r(j))<5)
            R(i)=10^r(j);
        end
    end
end
p=[1 0.806 0.6 0.22 0.125];
idx=find(p<phi);
idx=idx(1);
grad=(R(idx-1)-R(idx))/(p(idx-1)-p(idx));
c=R(idx)-grad*p(idx);
Re=phi*grad+c;
end