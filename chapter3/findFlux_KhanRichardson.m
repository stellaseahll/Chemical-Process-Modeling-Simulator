function [n ut Ar Re Cd]=findFlux_KhanRichardson(denF,denP,size,vis,dia)
addpath(genpath('chapter2'));
[ut Re Cd]=calcTermV(denF,denP,size,vis);
Ar=size^3*denF*(denP-denF)*9.81/(vis^2);
X=0.043*Ar^0.57*(1-2.4*(size/dia)^0.27);
n=(4.8+2.4*X)/(1+X);
  