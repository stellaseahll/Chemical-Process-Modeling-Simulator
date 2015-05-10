function errCode=validateInput_chapter3_thickener(n,ut,CF,F,L,V,A)
errCode(1)=errCodeVelocity(ut);
errCode(2)=errCodeN(n);
errCode(3)=errCodeCF(CF);
errCode(4)=errCodeF(F);
errCode(5)=errCodeL(L);
errCode(6)=errCodeV(V);
errCode(7)=errCodeArea(A);
errCode(8)=errCodeFLV(F,L,V);
errCode=sort(errCode(errCode~=0));
