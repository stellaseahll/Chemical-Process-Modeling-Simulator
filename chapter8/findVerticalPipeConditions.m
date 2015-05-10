function [Ptotal ,Pcomponent ,ev, U, f, ReCd]=findVerticalPipeConditions(Mp,denP,denF,size,vis,diameter,lengthUp,lengthDown,Ufsv,isFirst)
addpath(genpath('../chapter2'));
length=lengthUp+lengthDown;
if (length==0)
    Ptotal=0;
    return;
end
netLength=lengthUp-lengthDown;
Ut=calcTermV(denF,denP,size,vis);
G=getMassFlux(Mp,diameter);
a=Ut;
b=-(Ut+Ufsv+G/denP);
c=Ufsv;
ev=roots([a b c]);
ev(ev>1)=[];
ev(ev<0)=[];
Upv=Ufsv/ev-Ut;
Ufv=Ufsv/ev;
Ref=denF*Ufsv*diameter/vis;
fg=findGasFrictionFactor(Ref);
if (isFirst)
    gAcceleration=0.5*ev*denF*(Ufv^2);
    pAcceleration=0.5*(1-ev)*denP*(Upv^2);
else
    gAcceleration=0;
    pAcceleration=0;
end
gFric=2*fg*denF*Ufsv^2*length/diameter;
pFric=0.057*G*length*sqrt(9.81/diameter);
gGravity=denF*netLength*ev*9.81;
pGravity=denP*netLength*(1-ev)*9.81;
U=[Ufv Upv];
f=fg;
ReCd=Ref;
Pcomponent=[gAcceleration pAcceleration gFric pFric gGravity pGravity];
Ptotal=sum(Pcomponent);

