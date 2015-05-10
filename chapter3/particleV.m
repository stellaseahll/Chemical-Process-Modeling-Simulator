function Up=particleV(denF,denP,size,vis,dia,por)
%particleV Evaluates the settling velocity of particles Up
%   Up=particleV(DENF,DENP,SIZE,VISC,DIA,POR) returns the settling velocity 
%   of particles using the Khan and Richardson relation. DENF is the
%   fluid density, DENP is the particle density, SIZE is the particle size,
%   VISC is the viscosity, DIA is the diameter of pipe and POR is the
%   porosity of the bed.
if (denF<=0||denP<=0||size<=0||vis<=0||por<=0||por>1)
    Up=0;
    return;
end
Ar=size^3*denF*(denP-denF)*9.81/(vis^2);
X=0.043*Ar^0.57*(1-2.4*(size/dia)^0.27);
n=(4.8-2.4*X)/(1+X);
Ut=calcTermV(denF,denP,size,vis);
Up=Ut*por^n;
