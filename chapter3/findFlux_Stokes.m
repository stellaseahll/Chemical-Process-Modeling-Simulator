function [n,ut, warningStr,Re]=findFlux_Stokes(denF,denP,size,vis)
warningStr='';
ut=size^2*(denP-denF)*9.81/18/vis;
n=4.65;
Re=denF*ut*size/vis;
if (Re>0.3)
    warningStr=sprintf('Warning!\nReynolds Number is %.6f which is more than 0.3. Stoke''s law is not valid and calculated values may not be accurate.\n',Re);
end
