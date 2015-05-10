function errCode=validateInput_chapter3_thickener_StokesAndNewton(denF,denP,size,vis)
errCode(1)=errCodeDenF(denF);
errCode(2)=errCodeDenP(denP);
errCode(3)=errCodeViscosity(vis);
errCode(4)=errCodeSize(size);
errCode(5)=errCodeDenFDenP(denF,denP);
errCode=sort(errCode(errCode~=0));
