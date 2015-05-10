function errCode=validateInput_chapter7(denF,denP,vis,vel,size,dia,massP,bedHeight)
errCode(1)=errCodeDenF(denF);
errCode(2)=errCodeDenP(denP);
errCode(3)=errCodeViscosity(vis);
errCode(4)=errCodeVelocity(vel);
errCode(5)=errCodeSize(size);
errCode(6)=errCodeDenFDenP(denF,denP);
errCode(7)=errCodeBedDiameter(dia);
errCode(8)=errCodeMass(massP);
errCode(9)=errCodeBedHeight(bedHeight);
errCode=sort(errCode(errCode~=0));
