function [por umf Pfric]=findFluidizationCondition(denF, denP, massP, size, vis,bedHeight, bedDiameter)

area=pi*bedDiameter*bedDiameter/4;
%find porosity
vol=area*bedHeight;
volP=massP/denP;
por=1-volP/vol;

%find minimum fluidization velocity
A=1.75/por^3;
B=150*(1-por)/por^3;
C=denF*(denF-denP)*9.81*size^3/vis^2;
Re=roots([A B C]);
Remf=Re(Re>0);
umf=Remf*vis/size/denF;

%find pressure drop across bed
Pfric=massP*9.81/area*(1-denF/denP);