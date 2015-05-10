function [n, ut, warningStr,Re]=findFlux_Newton(denF,denP,size,vis)
warningStr='';
ut=size^2*(denP-denF)*9.81/18/vis;
n=2.4;
Re=denF*ut*size/vis;
if (Re<500)
    warningStr=sprintf('Warning!\nReynolds Number is %.6f which is less than 500.\nNewton''s law is not valid and calculated values may not be accurate.\n',Re);
end