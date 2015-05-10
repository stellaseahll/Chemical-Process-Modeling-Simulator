function ret=errCodeCheckVerticalAcceleration(verticalLength,type)
    if (type==2&&verticalLength==0)
        ret=34;
    else
        ret=0;
    end
end