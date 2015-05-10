function errCode=validateInput_chapter2_particleSize(denF,denP,vis,vel,sp)
errCode(1)=errCodeDenF(denF);
errCode(2)=errCodeDenP(denP);
errCode(3)=errCodeViscosity(vis);
errCode(4)=errCodeVelocity(vel);
errCode(5)=errCodeSphericity(sp);
errCode(6)=errCodeDenFDenP(denF,denP);
errCode=sort(errCode(errCode~=0));
