function errCode=validateInput_chapter3_sedimentation(n,ut,CS,CB)
errCode(1)=errCodeVelocity(ut);
errCode(2)=errCodeN(n);
errCode(3)=errCodeCS(CS);
errCode(4)=errCodeCB(CB);
errCode(5)=errCodeCSCB(CS,CB);
errCode=sort(errCode(errCode~=0));
