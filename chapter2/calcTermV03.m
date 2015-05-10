function [Ut Re]=calcTermV03(denF,denP,size,vis)
%calcTermV04 Evaluates the terminal velocity assuming Stoke's Law
%   Ut= calcTermV(DENF,DENP,SIZE,VISC,PHI) evaluates the terminal velocity
%   of a particle that falls freely under gravity in a fluid under Stoke's
%   law. DENF is the fluid density, DENP is the particle density, SIZE is 
%   the particle size and VISC is the viscosity. If Reynolds number is more
%   than 0.3, it returns 0. Only applicable for phi=1.

Ut=size^2*(denP-denF)*9.81/18/vis;
Re=denF*Ut*size/vis;
if (Re<0.3)
    return;
else
    Ut=0;
end
