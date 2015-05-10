function errCode=validateInput_chapter8(denF,denP,vis,vel,size,dia,Mp,pipeNumber)
errCode(1)=errCodeDenF(denF);
errCode(2)=errCodeDenP(denP);
errCode(3)=errCodeViscosity(vis);
errCode(4)=errCodeVelocity(vel);
errCode(5)=errCodeSize(size);
errCode(6)=errCodeDenFDenP(denF,denP);
errCode(7)=errCodePipeDiameter(dia);
errCode(8)=errCodeMassFlowRate(Mp);
errCode(9)=errCodePipeNumber(pipeNumber);
errCode=sort(errCode(errCode~=0));
