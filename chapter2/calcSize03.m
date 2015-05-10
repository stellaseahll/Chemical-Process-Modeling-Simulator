function [xs Res]=calcSize03(denF,denP,vel,vis)
%calcTermV04 Evaluates the terminal velocity assuming Stoke's Law
%   Ut= calcTermV(DENF,DENP,SIZE,VISC,PHI) evaluates the terminal velocity
%   of a particle that falls freely under gravity in a fluid under Stoke's
%   law. DENF is the fluid density, DENP is the particle density, SIZE is 
%   the particle size and VISC is the viscosity. If Reynolds number is more
%   than 0.3, it returns 0. Only applicable for phi=1.

xs=sqrt(vel*18*vis/(denP-denF)/9.81);
Res=denF*vel*xs/vis;
if (Res<0.3)
    return;
else
    xs=0;
end
