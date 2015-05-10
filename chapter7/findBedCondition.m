function [por height Pfric Ptotal Ut] =findBedCondition(denF,denP,massP,size,vis,bedHeight,bedDiameter,superficialV,pormf,umf,Pfric)

if (superficialV>umf)
    [n Ut]=findFlux_KhanRichardson(denF,denP,size,vis,bedDiameter);
    por=(superficialV/Ut)^(1/n);
    height=(1-pormf)/(1-por)*bedHeight;
    Ptotal=Pfric+denF*9.81*height;
    return; 
else
    Ut=-1;
    por=pormf;
    Pfric=findPressure_Ergun(vis,superficialV,size,por,denF);
    height=bedHeight;
    Ptotal=Pfric+denF*9.81*height;
    return;
end
