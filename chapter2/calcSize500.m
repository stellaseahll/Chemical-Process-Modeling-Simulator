function [Xn Ren]=calcTermV500(denF,denP,vel,vis)
%calcTermV04 Evaluates the terminal velocity assuming Newton's law region
%   Ut= calcTermV(DENF,DENP,SIZE,VISC,PHI) evaluates the terminal velocity
%   of a particle that falls freely under gravity in a fluid under Newton's
%   law region. DENF is the fluid density, DENP is the particle density, 
%   SIZE is the particle size and VISC is the viscosity. If Reynolds number 
%   is less than 500, it returns 0. Only applicable for sphericity=1.
Xn=(vel/1.74)^2*denF/9.81/(denP-denF);
Ren=denF*vel*Xn/vis;
if (Ren>500)
    return;
else
    Xn=0;
end