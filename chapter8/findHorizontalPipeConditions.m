function [Ptotal ,Pcomponent ,eh, U, f, ReCd]=findHorizontalPipeConditions(Mp,denP,denF,size,vis,diameter,length,Ufsh,isFirst)
if (length==0)
    Ptotal=0;
    return;
end
G=getMassFlux(Mp,diameter);
Uph=Ufsh*(1-0.0638*size^0.3*denP^0.5);
eh=1-G/denP/Uph;
Ufh=Ufsh/eh;
Rep=denF*(Ufh-Uph)*size/vis;
if (Rep<1)
    Cd=24/Rep;
elseif (Rep>500)
    Cd=0.44;
else
    Cd=18.5*Rep^-0.6;
end
Ref=denF*Ufsh*diameter/vis;
fp=(3/8)*(denF/denP)*(diameter/size)*Cd*((Ufh-Uph)/Uph)^2;
fg=findGasFrictionFactor(Ref);
if (isFirst)
    gAcceleration=0.5*eh*denF*(Ufh^2);
    pAcceleration=0.5*(1-eh)*denP*(Uph^2);
else
    gAcceleration=0;
    pAcceleration=0;
end

gFric=2*fg*denF*Ufsh^2*length/diameter;
pFric=2*fp*denP*(1-eh)*Uph^2*length/diameter;
gGravity=0;
pGravity=0;
U=[Ufh Uph];
f=[fg fp];
ReCd=[Rep Cd Ref];
Pcomponent=[gAcceleration pAcceleration gFric pFric gGravity pGravity];
Ptotal=sum(Pcomponent);

