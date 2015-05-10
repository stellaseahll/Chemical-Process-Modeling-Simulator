function errCode=validateInput_chapter2_terminalV(denF,denP,vis,size,sp)
errCode(1)=errCodeDenF(denF);
errCode(2)=errCodeDenP(denP);
errCode(3)=errCodeViscosity(vis);
errCode(4)=errCodeSize(size);
errCode(5)=errCodeSphericity(sp);
errCode(6)=errCodeDenFDenP(denF,denP);
errCode=sort(errCode(errCode~=0));
