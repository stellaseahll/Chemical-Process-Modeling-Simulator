function Usalt=findSaltationConditions(Mp,denP,denF,size,diameter)

a=1440*size+1.96;
b=1100*size+2.5;
Usalt=(4*Mp*10^a*9.81^(b/2)*diameter^(b/2-2)/pi/denF)^(1/(b+1));
end