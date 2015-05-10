function errCode=validateInput_chapter8_simple(denF,denP,vis,vel,size,diameter,Mp,verticalLength,horizontalLength,numBends,type)
errCode(1)=errCodeDenF(denF);
errCode(2)=errCodeDenP(denP);
errCode(3)=errCodeViscosity(vis);
errCode(4)=errCodeVelocity(vel);
errCode(5)=errCodeSize(size);
errCode(6)=errCodeDenFDenP(denF,denP);
errCode(7)=errCodePipeDiameter(diameter);
errCode(8)=errCodeMassFlowRate(Mp);
errCode(9)=errCodeVerticalLength(verticalLength);
errCode(10)=errCodeHorizontalLength(horizontalLength);
errCode(11)=errCodeHorizontalVerticalLength(horizontalLength,verticalLength);
errCode(12)=errCodeCheckHorizontalAcceleration(horizontalLength,type);
errCode(13)=errCodeCheckVerticalAcceleration(verticalLength,type);
errCode=sort(errCode(errCode~=0));