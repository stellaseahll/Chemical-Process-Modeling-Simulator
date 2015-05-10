function ret=errCodeCheckHorizontalAcceleration(horizontalLength,type)
    if (type==1&&horizontalLength==0)
        ret=33;
    else
        ret=0;
    end
end