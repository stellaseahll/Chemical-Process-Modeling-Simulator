function ret=errCodeFLV(F,L,V)
    if abs(F-L-V)<eps
        ret=0;
    else
        ret=18;
    end
end
