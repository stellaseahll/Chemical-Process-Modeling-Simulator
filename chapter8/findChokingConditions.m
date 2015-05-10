function [Uch ech Ut]=findChokingConditions(Mp,denP,denF,size,vis,diameter)
addpath(genpath('../chapter2/'));

G=getMassFlux(Mp,diameter);
Ut=calcTermV(denF,denP,size,vis);
    function f=solveEch(x)
        temp=G/denP/(1-x);
        f=abs(denF^0.77-2250*diameter*(x^(-4.7)-1)/temp^2);
    end
[ech f]=fminbnd(@solveEch,0,1);
Uch=(G/denP/(1-ech)+Ut)*ech;
end